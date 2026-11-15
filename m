Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9E1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZNEUdWKj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IbGZZz3i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XNnu+4CWKAt1mZbirX7yXEhcAb/VZnf34sFLG6GDqg8=; b=ZNEUdWKjJf/5gq
	ZyvVaMv2YRV+ELa2+ykS1ayoYAc4P7kw9fYID/rex4bcS+G06ByMvrJSgcj8XmALO14emDV3I3zOg
	1Y6dvAQP1lmMqEK0LYYGjK/hB17NyUPDq1/MwCuIzezVGDcqASV8319fV+p1zaoXzZUrfM8ffjjrk
	ZhaVb/k8/o7DQgJkQpP5CqLyDl9cuFMd+yxzGQKXV2KJiLOnR8HZK8//JTS77MlKmNB0WFqbRvqEr
	IPeEfPMjwjPKvSSSePqLxxvkflf+raEF/ftMVe/QobUOImGZkohQf8Dy2BWt978ZWF8i/Gr/7jr6N
	r0S68VLsFNbbczmNrTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWjy-0000000HLQa-3fwA;
	Sun, 15 Nov 2026 09:41:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWjt-0000000HLP8-1YNc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:41:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C98EA4595E;
	Sun, 15 Nov 2026 09:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F39C1F000C4;
	Sun, 15 Nov 2026 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794735692;
	bh=XNnu+4CWKAt1mZbirX7yXEhcAb/VZnf34sFLG6GDqg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IbGZZz3if4zVOx/vM2ZpfeZ6Uims1Duj+Dn3BW+MRUz4XBu7eQY4RkuKHW22grHWu
	 36SSubkHHe0loMbe0ytt9zFW4mlWBmM9qhL09QN3zr42XQnhEsWtaegErwVVC4Mmc1
	 1d8yl93vPWkS7iXFjFPUab2z/TpNJ6aU/wmdMjf6lvZXl6y3bWGJmBVGvuRLQ2YoEX
	 ftwBL80thNNOllg6F1sSK37BVv+FxDeaNfM6X+6LZoZ/ijF3L8D1NJcOcp8Un0rMnU
	 DILHBTOzbdO4DN6AVc80FjWq/Zivzy4NKU97mvVdtqXmHy862T0xw7RMuPxCNeFGcM
	 85EOI7ran2SOA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
References: <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
Subject: Re: [PATCH 0/2] clk: sunxi-ng: h616: Fix the EMAC 25 MHz and
 S/PDIF clocks
Message-Id: <179473569042.3056166.1982990416520172498.b4-ty@kernel.org>
Date: Sun, 15 Nov 2026 17:41:30 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Tue, 10 Nov 2026 06:02:59 +0000, Arun Iyengar wrote:
> Two small fixes for the H616 CCU, found while checking the clock tree of
> an Orange Pi Zero2 against the H616 user manual.
> 
> Patch 1 models the EPHY 25 MHz clock as PLL_PERI0 / 24, as the manual
> describes it. Only the parent and the reported rate change; the register
> writes are the same.
> 
> [...]

Applied to sunxi/clk-for-7.5 in sunxi, thanks!

[1/2] clk: sunxi-ng: h616: Fix the EMAC 25 MHz clock parent and divider
      https://git.kernel.org/sunxi/linux/c/93797c1f8455
[2/2] clk: sunxi-ng: h616: Let the S/PDIF clock set the audio PLL rate
      https://git.kernel.org/sunxi/linux/c/d0cd486a2b64

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


