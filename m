Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FDB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RsPhSVBt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iY0cVogF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xdxs12743NDoNJxbnDGKAhLTeXv90Ow3q001NJmFiRo=; b=RsPhSVBtNcSMos/Io4+gD3aOPm
	Dn+fKbh9ap71Y2CSandkIfSbqU0JvzIoUrPM+7ie0Bl30b8qkqsF8wdYqX7UbxpoMZRkkzzQIXCR6
	qxfUw9eAeGs572CBJBzvHOX1dNiYvOvf+FHwGi2rx/zBlY29TPtYmXYIdCcC4yoJS4LjjRwzCAYQ2
	nUALWlufr6shKsgyNpZOP1vQVNO8zhAo+FMkBQl1AB/nQ8mjnPcSy1HaCNE2GM/TzE236sDYqiY2m
	GuXsrxKZOUE4RLIFFnGLNJXApOd8wzAnkIShNqMuzmf5jMaSvgn8RTZrjI3IzysahWx3fyIX3yuiP
	M4NHA4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN61-00000006bJ9-2dQO;
	Tue, 17 Nov 2026 17:35:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTN5T-00000006at1-0Wfq;
	Tue, 17 Nov 2026 17:35:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DBDDE45F68;
	Tue, 17 Nov 2026 17:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D83F1F000D1;
	Tue, 17 Nov 2026 17:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936918;
	bh=xdxs12743NDoNJxbnDGKAhLTeXv90Ow3q001NJmFiRo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iY0cVogFK/z7QGVoaMgG1ymZmRQqjTfWjlHGqoCcByQxgAvsVAZ7t5hqehI6aIttK
	 HN6yNEXIeFfeP7d31+Ez6PRir/PwO1eGDDZfZ4/yLTuk7PbZyQK5GwT3i0RLvefNHQ
	 NYoj68Q9/p/Wihb7mjz0Z+A+XLBt7p6ITbtSQQajvohhh1GTprobAJLtVMlYTD7LkJ
	 BT5Ryo8OSIOX+KIds3Hxljd8OMS7SFHIRmcJgoVRIj5+5yRh2cKtJpha2PJXeSAbXw
	 JKX2F6ns4aVnI6NuVe0s7IX4lolK29oe5rxex/zIVt2XO0WExtllhcpKiB2oXC2A7P
	 944yyN522tkfQ==
Subject: Re: [PATCH 6/9] soc: rockchip: grf: Restore the RK3588 PHP StreamIDs
 after system suspend
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, david.wu@rock-chips.com,
 dlemoal@kernel.org, cassel@kernel.org, fancer.lancer@gmail.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, praan@google.com,
 will@kernel.org, robin.murphy@arm.com, iommu@lists.linux.dev,
 shawn.lin@rock-chips.com, sebastian.reichel@collabora.com
Date: Tue, 17 Nov 2026 17:35:16 +0000
Message-ID: <179493691692.3136.5141582035448551878@kernel.org>
In-Reply-To: <20261113-mmu600-php-v1-6-231196049a3b@gmail.com>
References: <20261113-mmu600-php-v1-6-231196049a3b@gmail.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The concern: the commit message says that 'The SMMU aborts a
  master whose StreamID was lost', but at this commit mmu600_php is…

--

soc: rockchip: grf: Restore the RK3588 PHP StreamIDs after system suspend

This commit keeps the RK3588 PHP GRF StreamID table after init. It also
registers a syscore resume op that rewrites any StreamIDs lost when PD_PHP
is powered off during system suspend. The op is only registered when the
GRF node has a clocks property.

> The PHP GRF is in PD_PHP, which firmware may power off in system
> suspend. The SMMU aborts a master whose StreamID was lost.

[Severity: Low]
Is this description accurate for the tree at this commit?

In arch/arm64/boot/dts/rockchip/rk3588-base.dtsi the mmu600_php node is
still disabled at this point:

    mmu600_php: ...
        ...
        status = "disabled";

None of usb3otg2, gmac0/1 or sata0-2 point at it with an iommus property
yet. That means the SMMU abort described above can't happen in-tree with
this patch alone, and rockchip_grf_resume() has no visible effect yet.

Two later patches in the series fix that:

  "arm64: dts: rockchip: Attach the masters of the RK3588 PHP SMMU"
  adds iommus = <&mmu600_php N> to the six masters.

  "arm64: dts: rockchip: Enable the RK3588 PHP SMMU" removes the
  status = "disabled" line.

So by the end of the series the restore does take effect.

Could the commit message say that this patch prepares for those later DTS
changes? Or could the patch be moved after them in the series?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-mmu600-php-v1-0-231196049a3b%40gmail.com

