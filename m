Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52C0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 22:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dy3SYgfv;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=LbPpzx2j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IcX3holNlfbuwWe3ymUNcnF4pepySHThrxLBq9wtl3s=; b=Dy3SYgfvhfCtwa
	SLrxACM1LVdIYkUncnSp4vo3e6crxsziHRzOo5gT9TBG7yw5HlU3csUaxj4+dse9HTQuHTrATaWRz
	NAQrTpN4AoZjJ0RRhx1hAonNOasz00jA9Kq1xdX6dLff1sa5HRfFRgw+OGR+UXgQ6366gaNm0w47f
	gKcV6wfRcItTtqf4SN5V7PYJSQb+3ni4w+xqAcvuumyvyQX8IoZfg5FAf5FL5hd7p8EA0QGm5xeKS
	v6hw2V03UUgB+VylZiUOi9fkK2Yg31BPmaKPWWIQ9pj+xYfvh+E3WL/fIhXNVIZN3jkiDeXyMVJuE
	bI/IBBea5/4oYns+IR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGPS-00000001rkJ-2lDD;
	Sun, 22 Nov 2026 22:51:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGOT-00000001rKj-2pJX;
	Sun, 22 Nov 2026 22:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=IcX3holNlfbuwWe3ymUNcnF4pepySHThrxLBq9wtl3s=; b=LbPpzx2jqb5JH5okmQ1Jw7ZMvA
	A5AWcc+1nHOMXWVRf5lA2aD9uBLp8CQff5xrM41vLOk9zF4Za3X3qoBoW4oB2AePlzyQKZ0IU9Vos
	jK6fP6uk5l5YBLoc5Z3QPAucSN2XkmEQgmo8wlL6lGGKe/SL4s9Ed3Z1VBCiGRQNAziJcTXwcY3W2
	jaO3VkuCEH672vnFfJfviNNtAefevIQfA5HEBCdFTI0XtcifhFjQPYUVB8lmzaYJeqjMJ0c2HOqo5
	YSz5W/dqNhy1TLoJd7lunMlTQUDW2W1JJopvQVE5v+EK4nbQ4zvmTb1Yf84XuDFlTz/mgt6MBbqiV
	tsHU5ucA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] arm64: dts: rockchip: Correct double space in rk3576-anbernic-rg
Date: Sun, 22 Nov 2026 23:50:25 +0100
Message-ID: <179538782468.3150822.17090825292677759861.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113185311.183045-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261113185311.183045-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_145045_893226_4661E4AD 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 13 Nov 2026 19:53:12 +0100, Krzysztof Kozlowski wrote:
> Correct minor style issue around white-space: double space before '='.

Applied, thanks!

[1/1] arm64: dts: rockchip: Correct double space in rk3576-anbernic-rg
      commit: 009e1d975af303a3b76b3d13846788fe986fd847

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

