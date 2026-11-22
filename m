Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3769D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 22:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T6R2gCUf;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=S9HritYr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4BM+qrLCQG7Tx5gN7bK0k9cYmhAdjhuB3LguEexBUjQ=; b=T6R2gCUfaRYrOD
	blffJvcNUN3de3kEsbh8YUY/Lis/UT18nQN31rfuCeEntFievl1CjFfnvpYq9SJeug38sE0wBScGU
	CncjsS+rq3yF70G1eEM3idy78SXpqgXYNNdvEYoQbxynqQUFMbwJnZcXUtzzApFZ/xck/oZbr8+BL
	cfjESbfDu8iq/2kch93fMPJ6thoQhbDZeOHAXUpfci7Nzy3ulnYBRPkl5uGnTEIOVs762JEy2ALbX
	JHzgVNYhLLZQfAUGY55ujxTZEPKabLJLl08x6+QaiupiqQYA66l86ZT742SLzv8ugfMWa+fXiHlhO
	Zgw0rnjU3mGRktwAmG4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGRy-00000001sMx-21IQ;
	Sun, 22 Nov 2026 22:54:22 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGOV-00000001rLu-1RLq;
	Sun, 22 Nov 2026 22:50:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=4BM+qrLCQG7Tx5gN7bK0k9cYmhAdjhuB3LguEexBUjQ=; b=S9HritYrDbD8pAM1lmbZNOMEOk
	xwKVm/NnoU5Jh5cQpBcnNZsh2KWd1972S2UC+XBUExB1N0cJUvFy/BEsK65h3S6Qf6Ko5Xell4Kxz
	7LuiJusJZH6CJBF4H6NAZ6OM31kLdIbaGsUGYlW91ZK0HtiqFyKON14PF8iU+bnwIQBnw7sPZBiP7
	oV9vKAzl/aLB+MCV/TGBA3MPwbME9RB9PdAdxK+Yc+dvJUVZKWgnGmZH03JAF5JmkoCENG2XRkQey
	i3uVIBruAt5nNs0nmXMe3bkMLiKQJev2rjxlRZi1fdzk3fDqCJi15byrhUwCtbUBELCBOXOWrxZ1p
	VkqmofXw==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Chris Morgan <macroalpha82@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	diederik@cknow-tech.com,
	arseney300@gmail.com,
	michael.riesch@collabora.com,
	shawn.lin@rock-chips.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add cpu-idle-states for RK356x
Date: Sun, 22 Nov 2026 23:50:27 +0100
Message-ID: <179538782484.3150822.3368192161153782434.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102173944.312295-1-macroalpha82@gmail.com>
References: <20261102173944.312295-1-macroalpha82@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_145049_694003_9C31FC96 
X-CRM114-Status: UNSURE (   9.51  )
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


On Mon, 02 Nov 2026 11:39:44 -0600, Chris Morgan wrote:
> Add cpu-idle-states for the rk356x-base to affect all rk3566 and
> rk3568 devices. With the fix implemented by upstream Arm Trusted
> Firmware [1] this now works on both mainline A-TF and the vendor
> provided binary A-TF.
> 
> Tests on my devices show this parameter provides idle power saving
> of around 5-10%.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: rockchip: Add cpu-idle-states for RK356x
      commit: f38c22652ec64441d4ddfb189697fe0e4ef8f293

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

