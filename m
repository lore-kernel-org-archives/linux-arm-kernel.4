Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FD4606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u242tY/a;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y9Rp4w+D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0SuW41ChieK1ZfiXTpBu+T0MvVfOyp+a8PPKJ6KJOEA=; b=u242tY/a5m3czQiNazlyrDGpyO
	ef5mmygpptkCcHufjnKWE/Nv+my+YexDW9jcEaTfPs7dwCiILP+hL0IY6qdzPCAsfW60loIBfA6x8
	/41Cz+yEzIL90D8bujFUT99ekInqkst4gElmM73JJFDwoBobpB8sgAS9XaMN34KIN1EpYvPVhGgER
	zw3TlBmDy0ceg1xlYN6NB/8KbFSwWq1SamWAeVdun+JV6ICT6cQY1vdSAZD9cuodQKiI9A4JEg46H
	4vXIr8KmqKMpUjicS20/mmvGMw/PH4+er93DZRLMZFNBkZ5RnVqsiP+s0fIM5Vvj0bqt/7vdVIsTo
	EngL+PsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdzA-0000000EYIq-1M3F;
	Sat, 07 Nov 2026 10:49:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPdyv-0000000EY5z-0qWV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 10:49:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E50FB43FD4;
	Sat,  7 Nov 2026 10:49:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794048548;
	b=jLl6WLsXAxcy57MOeO6bN1BBpxtPtj78GgzRIcHx0tUW98ze2TRJpvct6w85YeFGqovY
	 7BVf92n/LP9T2N3vHvQQD1Q0d4lBA/EalsO5P6peWbHhRYxOkUBFZNUT0fD4pDSVpJFMl
	 SwC5yr8vTHHspxO9yyPM907XktdE9aTw2EespohdJ+c2orJq7K6XVSfCf3AAyMS3R/yXx
	 zqSWdQOzvcp6ki/ShUMFESZSk5mzPddFhtkAgOrtNVtga64qPwZqYUIkyzTTXpGzAtmkw
	 WFebBW3J/lUNjFP09fbETI7/xwKovrk76d4T26QXE+3kGYjcNhYfVgWZhZWyfoyqZYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794048548;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0SuW41ChieK1ZfiXTpBu+T0MvVfOyp+a8PPKJ6KJOEA=;
	b=SeLBNVqblTMhovaGBxvvQaQgEfuZH53pqSsTCB1qZ6R75T0qAYFQlCCuOEx+3UkDz1xH
	 8v+SfTyB2MCvq2DT1w+8V+I1RUxZHOY60e1nhNKKEtRlhPqjeCW0ryRQP+Wkosnf7fZ55
	 dNUKoKMKHW4dT9IJzvM19ttD65mc3YAfB3sigfM5XnUvzWVmZf8FN3QK27bnEOO5PlT39
	 1U9/aNCX2SM+o2y7+0K3scgQfAcx4gGsEhDrz8PfokaPU9F1gdLMYcNr/odU2aWCf+FSu
	 1+Ugvva+SIdb6keU+MNDMK1+570nsS/8/92UKZF/OcnCnesY/RUL6UPQ87dUWJ2bbig==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1DC001F00902;
	Sat,  7 Nov 2026 10:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794048548;
	bh=0SuW41ChieK1ZfiXTpBu+T0MvVfOyp+a8PPKJ6KJOEA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Y9Rp4w+DlHLS6WEuOWrMBJV+jq0Q2C7lNg3R+hclqUpe65V0ViRdubzbducjLC/Jy
	 0x4uNSygiUMUaWVeouRh9SY1ywjo7M1Y1xJxnXzSnYPkJx6wPZUtPKeMcnnpPvas5O
	 mU51IJD2/2tEmRCsbS2cimbymD6pDpVu78O8/x/N7nOPE4SYXiRvTj/z/5ot92g/Up
	 DSzVuhtwymtLmNs7e7FU0Ek1TQRtM9pQkWgAcYZtpbZbRSd0uxBQDZ7X1fNIs5ArY5
	 5Vjy6sIrvCba7O7c6qBp96uDkON94bvzJSNqhVuiSclcqLxJzEkNyZuYToP4iZKma7
	 2J+zB82VWzGew==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 62EC447BAA;
	Sat,  7 Nov 2026 10:49:05 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 21:49:02 +1100
Subject: [PATCH v2 15/15] arm64: dts: apple: t8140: Add PMU Device Nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-m3-plus-pmu-events-v2-15-acf1e78da039@gmail.com>
References: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
In-Reply-To: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Yuvan Shen <yuvanshen09@gmail.com>, 
 Myria Sarvay <myrialsarvay@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=ADJFLFxUOqHDJmF0uWXvDM8Pu3rq+xTOczYNKGGrtjQ=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYst4zye751bpeaN9342JHH9YXiyyEWxe9ZZz5++2qO
 7o9r38+FKnpKGVhEONikBVTZNE3TdOezNZwqXSZ6xaYOaxMIEMYuDgFYCKHjRj++ytNaT+7x0Yy
 bFXdoYizK07knvyZkDF38cm1zrqTbY/KlzD8U2brm624fd69kHqLo08FubYfsC1fVHZoeX+LUM/
 me5fusQAADO5Nkw==
X-Developer-Key: i=myrialsarvay@gmail.com; a=openpgp;
 fpr=2F35662B930680D275A645B452444118A8ADFEE9
X-Endpoint-Received: by B4 Relay for myrialsarvay@gmail.com/default with
 auth_id=1027
X-Original-From: Myria Sarvay <myrialsarvay@gmail.com>
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
Reply-To: myrialsarvay@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Myria Sarvay <myrialsarvay@gmail.com>

Adds the PMU nodes to all t8140 devices.

Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 arch/arm64/boot/dts/apple/t8140.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8140.dtsi b/arch/arm64/boot/dts/apple/t8140.dtsi
index 89a26a1b2364..6fd671d1f088 100644
--- a/arch/arm64/boot/dts/apple/t8140.dtsi
+++ b/arch/arm64/boot/dts/apple/t8140.dtsi
@@ -143,6 +143,18 @@ l2_cache_1: l2-cache-1 {
 		};
 	};
 
+	pmu-e {
+		compatible = "apple,tahiti-e-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,tahiti-p-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		ranges;

-- 
2.55.0



