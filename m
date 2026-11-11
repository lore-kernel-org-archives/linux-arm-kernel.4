Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAB3606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N8ed8B7n;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LYrJQ9xT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hpjyt/s2QLGuYGj5afRjh1dUyaldroQS6rrCr7rFHZ4=; b=N8ed8B7ngzbig/iHPOzbV9LIHr
	6Hhoz1jOmG19YV9F7wX24c6rHTVwEk1eQDrnAxByFckIagy7LVWX7ForFgE12yA2eRZUOC31G2sEt
	X9aqQrG42py8BF8o1AB43GfsFC9gFLST8R5BV7hbcPKADDHQMatkYQ0NrjATrVY9UGQh2aL99E+yj
	jCeUjwbP/5b9+7zTsSZAPDBOmf/LebDK15jy/UKXwrN4Uecil7tbdE7rK2meuV40FUdtfV4eHGvkV
	NpsYz7eWTjvEnSMhgsiCULyI7e87cLBpdBkS4rujdFcqmKHxkVnJVRvOlpdL0G83VFQn/HEah+Cyb
	7PPNlK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7EJ-00000006den-1io2;
	Wed, 11 Nov 2026 12:15:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7EH-00000006ddr-3xeL;
	Wed, 11 Nov 2026 12:15:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02785636F5;
	Wed, 11 Nov 2026 12:15:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794399304;
	b=TMj9kJ+gxI87sb6s5IWrw85AaHkA8p931HS6965bJ23iAMtij8Jv+7Cbe6/K6avko4JS
	 WkaWb2hyWkkQ5xS0Jg0twUpBTjgk3LsUuMYDgFDkCYOSoWfXbr7IQY1q8WGro8wvWTIFi
	 oJqfqThOIHW/8fC5Mwuj7UzdCT6NrTmWBHNthQzGQqIX3N9nZNvDx3zDcDrJklyARbXL4
	 MOeO9A1OlmLWmJV8JOPAQtWdqnYPcHwMyQlLaYDz7TEnRlQdhpCzKFjxt+IDU4+9pDTpM
	 B9WHgF+VZyyp4oMEja+VAMje12ccHWz6/c2gyA2iRh5yMNaqgd6R+Ktrmz/lMieOBrg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794399304;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:X-Mailer:Content-Type:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hpjyt/s2QLGuYGj5afRjh1dUyaldroQS6rrCr7rFHZ4=;
	b=2vy3O9QxBnxWprSCZZvYw7FJSW5bqlUMjxDmJYru28jT76QSNPrtxgAIkMhrOvrfD16R
	 I7+qNUd7ktx4qWSmlxgjOw2/hyDSVYYHO2Ib1Dj9ahDzlpCCl0phitQ74Xh0DbXM13trK
	 COInzMo6HmnNgzGAjS5qTJxnyz4fsv6DI837nv2Slr8Mp0mPWEAjJLcyQlZqX1WyUPiM7
	 eEQsy2x+cl6nHzfG/9W5bRfgQLchPI/d02YulSHQFjOhssMY8UthyDWy2TBKvy89iExGU
	 8C7ae28lCadltk8mchRmWAvc0lq+WUK1QPGdP1qD3elPeRTzMJUZAFYN/c8yxHmnKjw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 208AE1F00A05;
	Wed, 11 Nov 2026 12:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399304;
	bh=hpjyt/s2QLGuYGj5afRjh1dUyaldroQS6rrCr7rFHZ4=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=LYrJQ9xTQLhEvP0OCZAQT3r4k5qPkoeRwQh2LlWpSB923tU/flhWrqiKJZxG7560O
	 wyEmuXbc9FB8Nq+KthntyWPP9qXNvWxIxH0G8s8/wpgQVcdr3Hkf6ZP89nLVnqjtBK
	 UZMG+ON22Kpic6RMWf/v/EQ9Ry1GAyP0gtR+yShMS6u/JDPoyZdJuM9vx0oxLUVtj2
	 O3u8jnS8i642HY14njjaWTzR4JBzlNz6y7aYmN7a+CFW6KzPcf0EjWXRxoLTjRKqqb
	 aZP77IAB1wJnvOg4K41S8BsjBvWZ8h2us4fiA7ASE32uSnYcnvx0jhyDPcAs/BMWtL
	 8oDsTnXdjM1rg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6AABE48F89;
	Wed, 11 Nov 2026 12:15:03 +0000 (UTC)
From: Mizuno Miotsuki via B4 Relay <devnull+founder.crepuse.com@kernel.org>
To: heiko@sntech.de
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, robh@kernel.org
Subject: [PATCH v2 RESEND 0/1] Enable I2C2 on UNIHIKER M10 V1.2
Date: Wed, 11 Nov 2026 12:14:34 +0000
Message-ID: <179439927405.86676.18160135777424812496.i2c2-v2-resend-0@crepuse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=609; i=founder@crepuse.com;
 s=20261012; h=from:subject:message-id;
 bh=skhAdHA3RZo/qHb7dMGwTpa8Pr/oRjo6b/TwlaWkzuo=;
 b=owGbwMvMwCUmds2G2fVJ/hLG02pJDFlfYrSefT21L5jBPV/5ytZ4lWcFp1qis9ve8fQK/5bZv
 rEzUzmrYwILgxgXg6WYIstsUfbyQ80rrs2d0GQHM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6BgzcHEKwFTv4Gdk+LezzXSiBHd7yoc+3oteeUvlKvMSVLvvRqdZhvw8apv4geHHn9mPMuL
 0lVYd/35aklMtpOZ9lcspzw+60e4SWwIiWbgB
X-Developer-Key: i=founder@crepuse.com; a=openpgp;
 fpr=9B150777C283A8D69D90823E16D63C0345E46FA4
X-Endpoint-Received: by B4 Relay for founder@crepuse.com/20261012 with
 auth_id=1166
X-Original-From: Mizuno Miotsuki <founder@crepuse.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: founder@crepuse.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable the onboard I2C2 controller at 400 kHz. The rk3308.dtsi pinmux
provides GPIO2_A2/A3. This common board preparation is independent of
the pending touchscreen device binding and driver.

Changes since v1:
- Normalize author/sender identity and preserve it in the patch body.
- Recheck ordinary and strict checkpatch and the DTS schemas.

Mizuno Miotsuki (1):
  arm64: dts: rockchip: Enable I2C2 on UNIHIKER M10 V1.2

 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 5 +++++
 1 file changed, 5 insertions(+)


base-commit: ae965b9856f033145e292b0c29082a26bcc45efd
-- 
2.56.0



