Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97CD606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YiMIKdBj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ihBJirsh;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sT9JE1O0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jYioDbmV2lkNLd/xY1Lk394T4HvjLuyRvjfb+TZF9bM=; b=YiMIKdBjfiD7/p
	Gi+9LNpttZoJ/GWXdP224KUvIJqWgjHyw7uRlva8FKYgaGDk2z+WLBA7iCnmahe5kr9Lr1CbpvQIN
	YloMLDLji7EK8KXF9GYgzDMQUnTpmiaviqS74nq/jURvCD+V+wBVUe07JWqrc9dXmWKFDhu9Rp/J+
	ozs4G87Na0Sqf/F80FAxx2MhOcS5yhjv1DHAagH2dHlycMyOS3OoPPkdphAtwYX/YFUGTt5rnOfny
	JkXqqv+K4EvzqZhYA3dMXOuYzenixGhYV+59iUOsX5rSCT6oAG61jIln2ahxpYxpwYd84VTVmsMyq
	TVcvDpiuNI26HDg5rLSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxv9-0000000Godw-1Igk;
	Fri, 27 Nov 2026 15:31:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxsl-0000000GmtC-2jen
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Nov 2026 15:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jYioDbmV2lkNLd/xY1Lk394T4HvjLuyRvjfb+TZF9bM=; b=ihBJirsh8XiWncNoEAMU4DGh/w
	UIx5FPX98g5Uu310iKE041phyV2+gSw/v2t8xhqWnLwXejdNa5om0otF6rtNv064qJFumvRU1TVUZ
	ZCFx4bX/C9MR9tsSkRB/6BeCEmR+v9BWxg7q4iPi1pb/h3e8dRZETMKHWVi/oi1OmgPmkfAqYEQqy
	iGGwwtSeSzKQePJvRwCdapm+EonEz8ZA8BwU08l55qYb8oyGhOj0vfABgvcW0ubWGTMD9VZRvHWhu
	X7EKfJ1v/kHE1YXZosarCPpHknF4IGxoixsx3VyChu6aecGjScTgixajdbmFr25a3iAi2I1s1sgRM
	y9PLGZ7Q==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWxsi-00000007uGt-38uH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 15:29:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AAB2B1A1838;
	Fri, 27 Nov 2026 15:28:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F4E56049C;
	Fri, 27 Nov 2026 15:28:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9827111E90AD2;
	Fri, 27 Nov 2026 16:28:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795793338; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jYioDbmV2lkNLd/xY1Lk394T4HvjLuyRvjfb+TZF9bM=;
	b=sT9JE1O0y/Q8g/zTZCiOZ51Wk1PnCeeuTAz2PjQQ/0z9s9zuyJXKDVus1SaiB9mGpE7Ixo
	R2T/xpYkSs17GEwKMBsnMv/uJ1htROw4LBTVXSerSXjj2modU1bONXI6KBapa0j/XIbeT9
	pTQRPzPwmPVxpCb3XN7Zaw8x8uXJsBLtoDbZV0Q98K+tRftUA16LjLw/GHId8/SlgEnaYz
	ADSQMr4BMGP6AMWHQrRz6J2YPgwBYmCPeMRlFaVl7tU8DWCy1/IOKmgOwLSUIFO2Mt+nP0
	MIAVlasIxNcukDy5zJglrAGUU+FxdZSjA1EaS9/5Ao/OOTQQAqP23Iam04WQZw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/9] arm64: dts: marvell: DT warning fixes
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
Date: Fri, 27 Nov 2026 16:28:55 +0100
Message-ID: <87a4mu1efc.fsf@BLaptop.bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_152900_702882_5E7103B6 
X-CRM114-Status: GOOD (  14.81  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Rob Herring (Arm)" <robh@kernel.org> writes:

> Another batch of DT schema warning fixes for Marvell platforms. This
> fixes most of the remaining warnings on Marvell platforms.
>
> It's best if the whole series is taken together.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Changes in v2:
> - Update the system controller compatible strings to avoid using the old
>   legacy ones.=20
> - Drop patch dropping 'phy-supply'.
> - New patch to rework ac5-98dx25xx 'behind-32bit-controller@7f000000'=20
>   bus.
> - Link to v1: https://patch.msgid.link/20261111-dtbs-marvell-v1-0-938788a=
ff3ae@kernel.org
>
> ---
> Rob Herring (Arm) (9):
>       dt-bindings: mfd: Add Marvell AP806/CP110 system controller schema
>       arm64: dts: marvell: Add AP806/CP110 syscon compatibles
>       arm64: dts: marvell: Drop SPI max frequency
>       arm64: dts: marvell: armada-8040: Fix node names
>       arm64: dts: marvell: Fix w25q32 compatible strings
>       arm64: dts: marvell: Drop unused USB 'phy-names'
>       arm64: dts: marvell: cn9131-cf-solidwan: Drop st,m41t80 reset-gpios
>       arm64: dts: marvell: armada-3720-gl-mv1000: Add switch fixed-link
>       arm64: dts: marvell: ac5-98dx25xx: Rework 'behind-32bit-controller'=
 bus
>

All series applied on mvebu/dt64

Thanks,

Gregory



>  .../mfd/marvell,ap806-cp110-system-controller.yaml |  59 ++++++++++++
>  arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      | 101 +++++++++------=
------
>  .../boot/dts/marvell/armada-3720-gl-mv1000.dts     |   6 ++
>  .../dts/marvell/armada-8040-clearfog-gt-8k.dts     |   4 +-
>  arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi |   2 +-
>  .../boot/dts/marvell/armada-8040-puzzle-m801.dts   |  10 +-
>  arch/arm64/boot/dts/marvell/armada-ap80x.dtsi      |   6 +-
>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |   6 +-
>  arch/arm64/boot/dts/marvell/cn9130-crb-A.dts       |   2 -
>  arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi     |   2 -
>  arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts |   1 -
>  .../boot/dts/marvell/cn9131-db-comexpress.dtsi     |   4 +-
>  12 files changed, 127 insertions(+), 76 deletions(-)
> ---
> base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
> change-id: 20261111-dtbs-marvell-3ae21c8ac47d
>
> Best regards,
> --=20=20
> Rob Herring (Arm) <robh@kernel.org>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

