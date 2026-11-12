Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86D9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sOShNA3D;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMBL3i1x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UikW9uf/xFnA2N8rJ0SI/amxaDAWBP7DQO//iFgbEYA=; b=sOShNA3DZA1Ld3
	XdHA1F8QIyokE6WPECoxSZ37LwkmQjp5X/QpTE7PQTJkYlJMFtOEL/Sb8MvNJGzQT4n67W1kiB6Gv
	hLpaL2rRR6nykYv+WL05RqGww5A3dnS46cuv6kBpNS4bl00+Z8JabgUJwWYJzQQUaJugwJpLTwqcV
	JNHzpgQ3IcOoesv/+e8TOx2bMuLLPrRPeOcoBkaxkoydKy1iEBzdweMNtI8rzZb6qekW18BXBfDnZ
	yjelaI14DgwaGbxEY0WNcJHBco7FJXdFFzeKzOzPNHIYmDtJOUM3uU3T4NJv7WJbmZjFDnjVdeqyG
	+S+rOsoKscEJogpDw7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTcV-00000009oqs-3p2M;
	Thu, 12 Nov 2026 12:09:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRTcU-00000009oqY-3eRz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 12:09:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE9B04361C;
	Thu, 12 Nov 2026 12:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD0C1F00A06;
	Thu, 12 Nov 2026 12:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794485373;
	bh=UikW9uf/xFnA2N8rJ0SI/amxaDAWBP7DQO//iFgbEYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oMBL3i1xkKLBRWn6/ATajmAx/jiD8aMP3hh+WJeClwzsuQPuQKrqmGb5H5+1IVZ9M
	 j8DmwJzKzTfcZlNIqa/dBcacFTGey1dM6O/PGAe0Vglb9Xv7BWuEAGnSUav7WReLBE
	 DuL03vZK7iDhCyfd2BuBFln6lMnjXowXb1ZyNa/F/FZJwbmA4KZ1sBuC0/baS3hpuz
	 zBVdllTc1HmsOSgiFJObK36lHjlCGz1jiW/ATLmvIX7eKM3Dx2qp3q0J5VaA2OXp/h
	 +Y5IFFxioN2dLew/njScHCWhM6t/L31KE4K59OAwhdb1nUac+N41H/9xYc0RuPFXIT
	 4WJO79GhvOVgA==
From: Brian Masney <masneyb@kernel.org>
To: Michal Simek <michal.simek@amd.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Linkai Gong <gonglinkai@kylinos.cn>
Cc: Mike Turquette <mturquette@linaro.org>, 
 Soren Brinkmann <soren.brinkmann@xilinx.com>, Kees Cook <kees@kernel.org>, 
 Babanpreet Singh <bbnpreetsingh@gmail.com>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20260908084727.1552042-1-gonglinkai@kylinos.cn>
References: <20260908084727.1552042-1-gonglinkai@kylinos.cn>
Subject: Re: [PATCH v2] clk: zynq: return -ETIMEDOUT if the PLL never locks
Message-Id: <179448514302.1202846.1111029538170940837.b4-ty@b4>
Date: Thu, 12 Nov 2026 07:05:43 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=469; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=gzP4VH5mbkB9Vv26t1n4TjvafvjC91W5uK6Td8dMPhA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+rilp4s7Tf+h0wCeEQyrDfea3yC8nK/brb7bk5irVj
 7C1SvbpKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCI7DBkZ2p/qFPc1T9ywIfDy
 xMmGS4tjzGstu7eUrlv/xZ8n2OCxESPDR0uPzGXynWGbdvan2+0wKhXsuF3blW6cvdQkf++pr5e
 YAQ==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 08 Sep 2026 16:47:27 +0800, Linkai Gong wrote:
> clk: zynq: return -ETIMEDOUT if the PLL never locks

Note: I reworded the commit message to drop the changelog.

Also, please consider posting another patch that allows compiling this
driver with COMPILE_TEST.


Applied, thanks!

[1/1] clk: zynq: return -ETIMEDOUT if the PLL never locks
      https://git.kernel.org/clk/linux/c/b015dff34319

Best regards,
-- 
Brian Masney <masneyb@kernel.org>


