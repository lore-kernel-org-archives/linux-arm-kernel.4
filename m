Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB75606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ljNAUPAP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fx8NPYoy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q6Wc+PG6yS/L/j98ERh1tXxofLkDU8ftPN7DVEoW1HQ=; b=ljNAUPAPRMKJkIHuB0MBJUvKDq
	qHueKjhvCjrRU3d75TiVv6gDx7zKOJQVI3zb5AEkUxkm2I61FduRg15AqtbPrC9ErbaZNhqejV4Vl
	9m+o//SU6EHI0JLKnXlWpTr8ENRucoijA4oOG3f6jbWyKoBW+Obs6x/W0E6HfT8FcrqwHKIqJiQj7
	xiq3Szi6aHBzoK51UykkzPa7OJzSBdth82tP2YAznqFiyUBEzTErTDKyyqiuN0Z+ISp2tkeVpsQ3K
	gWU/Z0qCEiNUCispjDSAY9nomCT0BWC/FIG4UtjV1MBU6exwXUMqgIWSPEX+yEadhuaNtSZtj58t3
	PB7N1VPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW52-0000000Cbg7-1hhM;
	Thu, 26 Nov 2026 09:47:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWW51-0000000CbfD-3OeN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:47:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9059C40894;
	Thu, 26 Nov 2026 09:47:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686471;
	b=j84FGpCI9jAyONdhttMALyPojjOwRR5oQxpuaIs65rqIQRxqR+QnVhLkCiGPFaS+U2MZ
	 zuwKrGvfUZ5UaVLvzs7u3E7M/wIBQIvBJ7Vn7IfKiZXmMujLduN6dmMc/Bk+KdVL7gA5K
	 GSsVmWH5WPwjHkivhOFMOKjKMvUKDAxG3xTyqqLDjnDw1sg06KUgmItC4I0o7qMxYXc+M
	 HcK8RgDV6GItojU24SDVfFLatmDUwQQnTsjOnmoM2IPMsjmj0GerddoIBzrG4zD/Lf4yi
	 DEw2aNqgNwWnqs4SI7If6gmGrpVFijt7kxIY5URZ/0P3VlEgWPHZ1yHYHdiMN/y2RYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686471;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=q6Wc+PG6yS/L/j98ERh1tXxofLkDU8ftPN7DVEoW1HQ=;
	b=biqx3bdzzPLut+PUHH39JlPjo1UITB4m+d0itHx+D+RWBEia82+sGdk6s5QsO+3iQ85L
	 rr+CpxBuIBk/pLrHmCZa8J4J3mdzerZyENomIp4CjDwR4fAQoqlEWHYeOSSSuY1R+jJg6
	 K86LmUXiOdDtXTntfVOjrD6XyfO7h/HkX2/Vf52YzHtCSOi9cxF6gedUEfX3zIOBYyPUv
	 8/D5/CMKwdxjD5WdQm2QaRQjb8KEgcCmVY5oK36BeKelsHDwoAcIugMNITvIHUsKvTzd+
	 Y39ol3+WNJQokSiDHeflxrIDzThVQHRj8q9LE3HCYqWe376MrgYkwglf0EAW+5UQmdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD2081F01568;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686471;
	bh=q6Wc+PG6yS/L/j98ERh1tXxofLkDU8ftPN7DVEoW1HQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Fx8NPYoyA+XyE+E+ydZ23Kg1JZ9PyBLLAS6+De044G1wyQG2rNAimRLw2IOeFX3GU
	 6ZWZPHEcgg+38NX4jDUo7IGEHSN10aLSqHEdI7K8hwQrjGG3TI1zldmgnWxl3Iq7jU
	 xKA/nEwJaGtgEYzewKoRzAwnAP6xa/Was6lPz79Z4HN8NKz6HmY2Aq88OJi1R1MrNl
	 bSQnTfAVjkFHTeFPuGG58HghnWE+qyeX13++KWLs++zYc/2yOttLzVngZNSImGQOjA
	 xnRISnurloO0aaHQbIWmD4Hcj8JvNIJ/oz4zbW+nV6aVboqtsrJB+t9Cz0e7qfJwAP
	 C7uL7Wl/J3z9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5ACBE4D3BA;
	Thu, 26 Nov 2026 09:47:37 +0000 (UTC)
From: =?utf-8?q?Alexandra_=C3=98stermark_via_B4_Relay?= <devnull+alex.cramt.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 10:47:36 +0100
Subject: [PATCH v2 2/3] dt-bindings: arm: altera: add Terasic DE25-Nano
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-de25-nano-v2-2-02e43ba72681@gmail.com>
References: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
In-Reply-To: <20261126-de25-nano-v2-0-02e43ba72681@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mahesh Rao <mahesh.rao@altera.com>, 
 Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>, 
 James Clark <jjc@jclark.com>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686456; l=977;
 i=alex.cramt@gmail.com; s=20261118; h=from:subject:message-id;
 bh=QglOvD99R7zKu7gZQ5QqRg3vMc8/faE3VeHwT/q8HmY=;
 b=x9Ws0y8pT0iqSSW+aLAajFO9W0v7u5RRJNPif0IPr7pMbjH982xNw1UCsxQJaBgF2eq5Xd12k
 MQ5xARyEdSUBDw4Nu2gAgK+lX2Ix6HiE2/GVvUvIig9gunxws14kr9v
X-Developer-Key: i=alex.cramt@gmail.com; a=ed25519;
 pk=vQBaXUvFG7cCIaWDKclPMjo3b4XfPEVkuPjaWCkYddc=
X-Endpoint-Received: by B4 Relay for alex.cramt@gmail.com/20261118 with
 auth_id=1561
X-Original-From: =?utf-8?q?Alexandra_=C3=98stermark?= <alex.cramt@gmail.com>
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: alex.cramt@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexandra Østermark <alex.cramt@gmail.com>

The Terasic DE25-Nano is a development board built around the Agilex 5
A5EB013BB23B SoC FPGA, with 1 GiB of HPS DDR4, a microSD slot, a gigabit
Ethernet port and USB.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexandra Østermark <alex.cramt@gmail.com>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index ae38ba0dc..75f874e8b 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -118,6 +118,7 @@ properties:
               - intel,socfpga-agilex5-socdk-modular
               - intel,socfpga-agilex5-socdk-nand
               - intel,socfpga-agilex5-socdk-tsn-cfg2
+              - terasic,de25-nano
           - const: intel,socfpga-agilex5
 
       - description: Agilex72 boards

-- 
2.56.0



