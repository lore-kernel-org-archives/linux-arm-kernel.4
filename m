Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8C1606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xxlvt8cF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E10qOj4r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=NTZ0SNzTZ2JEuh2ZAJOzH2cPlW0Ebx8D2XBL6InHqUg=; b=xxlvt8cF79LJB+dWFm8m4Lx5Ke
	P5Qs2xhI3UsfxHquvy8O3hlwh8lI2Q7N7G0FNYH9wkLoGNZUGLKQfZGbDhj3rgJL9XbRiYOOpRvTN
	b5iqssZRscOPVpcnoR0r1mZVTuFyf3va6ehWadrFf+T0kDTkmtSe52lL6oKCCzqRPlFJPaCLaqxei
	sj0YtQwlMCVTKkPco/oOiyS+57xup92k4d/rlOtVeEg2E4gK+8O/VYb5K8Y06kqMhDADVNZv+9icw
	0kUUtkIa7B1zqbPYvzh0S2+dX7qTCpLRZTuCY/UTDnrrEeB8vU8TPgwscaUfqFTcVgclhcCRlaTTa
	ycLtbGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFc7-0000000AVVE-42EC;
	Wed, 25 Nov 2026 16:12:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFc5-0000000AVU5-48fN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:12:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A51846398;
	Wed, 25 Nov 2026 16:12:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795623173;
	b=A7LFSZNqU607keSYnix5BUGrdhPIOlJlglRCCU/+BAjfgrEAyxrySl7KOct2+EjGTCDM
	 eQO2CRL6XEC8lZYOSxJlvbLwpFwd9iEbJ1FHDmavYKy8iGjcIUL9DXA5bZlekHwdT8A2b
	 N+w5PcWckuVipSNSyPv7Shkv2eDszkFW50WkNyemIHZ7ai5wgFZbGCrFagxjorJvcpETD
	 m2nHFZc4Pi/D8xcGOLoEomD3tkjYYpX3D5fsvoPjfnkr0p3OEvwFzH9ORHBy0MKuyJCth
	 PE/GQ7LL4MlFRCvdVrY9/XaapRaJn8t21cIxXHfBLxPfss0Rlkj0v2PsX+r118yo9gg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795623173;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=NTZ0SNzTZ2JEuh2ZAJOzH2cPlW0Ebx8D2XBL6InHqUg=;
	b=CEwepKG88NORh0SRdGdZCHrKf2pwcUZydmTqAfqLxoF658MxMQ+bw30CS+/c7XBgFzRf
	 +fp6c8xEaAZszZMMhP1NQKlTLe4ljdvMPOA3uLFXxWuKE5VNrtpdva5JVPffYkLpYuRbs
	 +aRejEzxRbvsIFcw4I7vPNxJYqI1Whtdxd7liSYXv5GOAvpA4uQdHImYoE4b076Hd1LSa
	 bUUzMA023iI2ON3Ehiq4bYdAJ+PHyQC6CFFuEXjNdlGld22gDp1BhRbiGOIMDjKZ2aM2m
	 k+cdvVUwlFyD439WUjJEONzRU4+lNPe7qMA0f3oyRgCSKLUxwSMK7pFmr90e4hrKxeA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 202D21F00AE3;
	Wed, 25 Nov 2026 16:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795623173;
	bh=NTZ0SNzTZ2JEuh2ZAJOzH2cPlW0Ebx8D2XBL6InHqUg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=E10qOj4rTceGGeRKmnB35azqfCjoA6yuu2dx15526qkYgxsvFiIM7lCLYr0B2EvBy
	 00sWtmHKOnnpkvvpUYAdUDKgyo8z2paGTreQqkQV478zPYNt8DaiJ+3gxCNbF8Wd8f
	 /o+HsVPq0QaOHy0j6HWWwONxkb+Fg11jhDvPTELpMNGxrpYaZTPcihjHTtGvLPZtcI
	 yf6TM0EjkSJYAzRkQkp2eoUNhM/Pa4RFvBrAyCeHssIH6pW6mfwQJ9Z8butkxjc1mT
	 pcoElJ/PAOedu1qQtow9I1r7lu6aD/Xjs+9LJa8DR21N/aE6tUu/tVoUrhcMLCAjdu
	 3tQgt1rooj8+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7C7404CF59;
	Wed, 25 Nov 2026 16:12:47 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Subject: [PATCH v3 0/2] Add USB support for Exynos7885 and enable USB and
 FG on gta3xllte
Date: Wed, 25 Nov 2026 16:12:40 +0000
Message-Id: <20261125-gta3xllte-usb-battery-v3-0-2ef962bf5423@mentallysanemainliners.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTsJLdiKVzEuWhxgDEHTGQyGc
 HeKLt/i/xWEEpPAtVgh0YeFX1NGdSqgHcLUE/IjG2xpnTH2jL2GahlHJZwlYgyqlL4YLr42vnO
 NdR5y+07U8fL73u5/yxyf1Ooxg23bAfBKBbJ5AAAA
X-Change-ID: 20261125-gta3xllte-usb-battery-a87417f69267
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Umer Uddin <umer.uddin@mentallysanemainliners.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Henri Ommer <henri@ommer.net>, David Virag <virag.david003@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795623167; l=1837;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=kpn0cpERSh/Ga6YdBXYn7twRHHIGblxKBB2fEDSemIw=;
 b=/l+UvcwX5Ng35YNKWuwYMVIZ9cqOucSSq4NLhgLWQOA0cduHh51C8ku69lcPaJN7dr83KyaJ8
 XVtRAwrER2IDy4VaccSNif3ClnII3qkeb2a2xXfQvxiKDqfgdsHAd9h
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi guys, this patch series enables USB and FG on gta3xllte. All is tested.

DT changes were tested with make dtbs_check W=1, and the dt styling check
scripts with --mode strict flags, both of which returned no warnings.

Please note this patch now depends on David Virag's changes for USB[1].

Best regards,
Umer

[1] https://lore.kernel.org/linux-samsung-soc/20261125145458.2594179-1-virag.david003@gmail.com/T/#t

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
Changes in v2:
- Drop patches that are being picked up updated and corrected by David
- Link to v1: https://patch.msgid.link/20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org

Changes in v3:
- Change dependency link
- Move define maximum-speed on board
- Link to v2: https://lore.kernel.org/linux-samsung-soc/20261124-gta3xllte-usb-battery-v2-0-80bdcb1753bb@mentallysanemainliners.org/T/#t

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Henri Ommer <henri@ommer.net>
Cc: David Virag <virag.david003@gmail.com>

---
Umer Uddin (2):
      arm64: dts: exynos: exynos7885-gta3xllte: Enable USB support
      arm64: dts: exynos: exynos7885-gta3xllte: Enable FuelGauge support

 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
---
base-commit: 7ed7d0761cca220e521c66f87b48def6c5a8edf7
change-id: 20261125-gta3xllte-usb-battery-a87417f69267

Best regards,
--  
Umer Uddin <umer.uddin@mentallysanemainliners.org>



