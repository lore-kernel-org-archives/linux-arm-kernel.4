Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A855606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x4K0ANJc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dCs9h+i9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=APfVu8lVqKryNMIrdqT6nl3CYZZS8KAyfP5Xehg1VF4=; b=x4K0ANJc4h30o/KwHN/rmXpsYa
	8Fi0uxdneOM0VvOxCb/U8Z+YkD4BGbfqUSz7abMeiabSVR2bMksUWUVqRjv13JBtiO6i6PucysstQ
	JqyPQZyV6AK1jGba13t2rpPJ+JEfE2CjSjEKB6VEjjliqTk3J2teNy2Pdp6C4xsX0kiMWrwjDjkvG
	bfUZlz9f2/RtWEtR2vAvWM7QigAusp3oNuFLdrmP5uPIpE04Pkr8q//UHmmNyIeoE497JgQwMtOsI
	rmXj4TeNMHGrLQYy6k2aHcXJ8O50gQjlOiAJSJjCGr57+I1M1vJjXDq1PgHSBlAjUdW0damgOxM7m
	7K5HigGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQAH-000000096c3-3Ltd;
	Thu, 12 Nov 2026 08:28:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ7M-000000096DX-0dsE;
	Thu, 12 Nov 2026 08:25:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9705261260;
	Thu, 12 Nov 2026 08:25:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794471911;
	b=hLL/bkUyRiXn7uDo9Leri+5b7er3ZwTQTqijWmD5DuA+yBUCj2VA+MmIqmajccMc8xt2
	 v/H9AUnC8w4TlKQOiX002y70GjJATi586J+iQ6eCA97obQHJk4aCKHEarmVBKgneS1lkv
	 f1YIIi9nB9Wp6b+TBu5pNx/GUlojch/ujBO90O0//81lodZJqEuvODjfXEVwibUvjJGkW
	 0qRss1OgtoF/KBGlhEMqZwTQ0AiJOUz4z+eP1Y+Tju6EY40bGwU8tjoY+9Srn1ObMwfkw
	 2gO8BH+t27H9553hNe+XAw/bgCp614bvgt4LXqdzJWjfgyDzwRwTQX1vkMRZJk1EadA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794471911;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=APfVu8lVqKryNMIrdqT6nl3CYZZS8KAyfP5Xehg1VF4=;
	b=gvosYrkLqeAMEfPTwYMzMspuqouGCouVoldx+BOn7gPIbRJoN8A1yftGEJ9vJQTy9QIy
	 NUc0RO5n4KQK2UimA1/leWp3v2Qh376ham0QP42PykaJmJ3qlCGIDow8xY+OY5BiqhN4g
	 6ySNZiJ3vmlCThTMMsQGXEbV6YnK9OaXVFwB6bIhSB44S4gn5jXGOAjo6OzToKpmoM1qa
	 AQWBKvcLTgSiRhYvSayaOSB3DJHompTOGnw6VurVJIGVZBCeGQUcgdXpaojPIL70V1D1U
	 HNuiZj06jAk3zD1bIHRR0bEiphZuOEbOj2DLrj+eYKqwfD8EDJisKwOGHSOhsY2x4oQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8E401F00A05;
	Thu, 12 Nov 2026 08:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471911;
	bh=APfVu8lVqKryNMIrdqT6nl3CYZZS8KAyfP5Xehg1VF4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=dCs9h+i9WIFdnRYtDTd2YAqi5OmWzDUEbiDFUF89yrPAmSwkAdAucc58lyCCKUcIi
	 gvmEO7wCj+lY+alQw6rfC9WLh413aGLp+oAfsENGpoEbXujpvmeG3J2WlZrzdcn7wP
	 smG2K28b3BKhAUZV/7hY/oyigUFnr3g6qaD8iynYMlNICqpbGLHsFAwLGOBzKr0dUA
	 2Vo6pDUI8aia2/ZdNzR97EqLYhFaXtTOC391oaX5xWgXllglj0YXn39j8gCo4pj5M5
	 fFv5AIt+k+nOBAMLHeB8oXsue/Hxj5iJHTWfWEBp0dZsu+MfzzF0QrbthTXoGZzvhC
	 UYzA1WzKKM3TA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3F8A849336;
	Thu, 12 Nov 2026 08:25:10 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:25:10 +0000
Subject: [PATCH v2] arm64: dts: rockchip: Mark the Orange Pi 5/5B Type-C
 port self-powered
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-opi5-typec-self-powered-v2-1-751906d65b70@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywrCMBBG4Vcps3bADGqKryIuNPmjI9KETOuF0
 nc36vJbnDOToSqM9t1MFQ81zUODrDoK19NwAWtsJlnLzjknnItueXwXBDbcE5f8REXk5KMX9Kn
 feE+tLhVJX7/z4fi3Tecbwvjd0bJ8AOfJKHV7AAAA
X-Change-ID: 20261112-opi5-typec-self-powered-f7d72e8f8477
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794471910; l=2783;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=mTmto45zL5e2iy6mJQ65zZtp+JqwhKT47UOcR9QvZRQ=;
 b=Gtwhzcqebs2Kpwt08HAdD8Qmf1L/z6vUvuOwPX1Ky3oxf+oEt+2w3jJEJo88J2CuUBKldcwSc
 KQGJEpMdbAPAfO9D10xRFhsNrlq7dKTKXsCPtvqWU4evetVlaPJ2oQk
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The board is powered from its separate power-only USB-C input. The
FUSB302 port's VBUS comes from vcc5v0_sys through a load switch, so the
board never runs from this port's VBUS.

Without self-powered, tcpm keeps Rp on CC during PORT_RESET (error
recovery), because opening CC on a port-powered device would remove its
own supply. With self-powered, the port opens CC for tErrorRecovery
whenever it resets, including at boot. A partner left in a stale state
by a warm reboot then sees a real detach.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
This was patch 3 of the series "usb: typec: Find a Type-C partner
after a warm reboot on the Orange Pi 5"; it is split out of v2 of that
series so that it goes through the Rockchip tree. It does not depend on
that series to build, but without its tcpm patch ("usb: typec: tcpm:
Don't cut a pending state delay short on a re-queue" [1]) the open-CC
period at boot is cut short.

It touches the line next to the one my "arm64: dts: rockchip: Add
USB-C DP AltMode for Orange Pi 5/5B" (opi5-dts v2) adds a node to;
applying both needs git am -3 (no conflict). I can resend it rebased.

Tested on an Orange Pi 5 together with that series (v1): after a warm
reboot the USB-C DisplayPort cable was detected on 4/4 boots, and in a
later run of 30 reboots the partner was attached on 30/30, with CC
opened in PORT_RESET for 100-112 ms on every boot. Not tested on the
Orange Pi 5B (same dtsi). CHECK_DTBS for the Orange Pi 5 and 5B shows
no new warnings.

This patch was developed with Claude (Anthropic) as a coding assistant:
it wrote the change and the commit message, and I reviewed and tested
it as described above.

[1] https://lore.kernel.org/r/20261112-tcpm-attach-reboot-v2-1-b4bc6ca83490@gmail.com

Changes in v2:
- Split out of the USB series, where it was patch 3/3; unchanged
- Link to v1: https://patch.msgid.link/20261110-tcpm-attach-reboot-v1-3-7657cc1e2dca@gmail.com
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
index c153e7248727..04cc0b4ff661 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -142,6 +142,7 @@ usb_con: connector {
 				<PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
 			source-pdos =
 				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			self-powered;
 			try-power-role = "source";
 
 			ports {

---
base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
change-id: 20261112-opi5-typec-self-powered-f7d72e8f8477

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



