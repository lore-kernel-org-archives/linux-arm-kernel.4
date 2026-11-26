Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2E1606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4sfhzRQf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D3vWj6++
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kzXVAyWbPKOQ0Nvu6ytm9UohTm6nO9mSl5COSJVLAXs=; b=4sfhzRQfx2C7qR
	bcrPx0GIsgtFRFz4HAtD5bDWbr2imIoCZLq0djJFDhCWNTqdd5sIcLYSttrAWxauczjC446BrYGIM
	+hh3H5yYwqLnj9jHIIaB2eBzsqnscIcoVFa+hKww1z3ifhnxQN6gzHsv/BPeOvVBTmjsJurPUfhvg
	GEyFqOsYEjCfIUs8f9YImrrowhzkaiRYztRkk8dnHN6AxafWMicuPwHIzyt09Ki1H3bYcDxPAARxP
	hqZ+RTOb6ca9t1OROIs7fZH85Wr2ecKU41ZOVSaaJwxcrwAiIQM/qlN3HDQWNBoXIpVBW+p/ODFlM
	ixblz7Bpa+HXZ1gQxOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUI-0000000BfSb-2Whj;
	Thu, 26 Nov 2026 00:37:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUA-0000000BfRA-2xHW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 77AA040818
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156D61F000C6;
	Thu, 26 Nov 2026 00:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653434;
	bh=kzXVAyWbPKOQ0Nvu6ytm9UohTm6nO9mSl5COSJVLAXs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D3vWj6++G7/X7eMsBd+yLXwvbTQ9EEg26cXrYYeFK5tfpA2i4uL2qbiqx6mC098fC
	 95WacM7+w9c8Gy0JEZQPDd4IM6rO+h8YO9jFH8Az+lZjkEH0xwaCqrWMO0+bloAycs
	 4zB/NDCvgbmuSc9bYN+ABpvvQXAnlMsgIP177Crz1pm4WNy0WS6/hU4ud6qPIvshrU
	 25d0IaDNV/TW+cqPBfprAbnRQByO+57odZsDs1LEaaGB0LGGZl2kcfZX0QKDVrIWDN
	 56PiamodQDV/SQjj8y+Mru7Oeyzw/vTygIIyDergQYWZHzt+ioJt7/LJTh0k3fHD/h
	 2Aww9XGW+RJig==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:06 +0100
Subject: [PATCH 02/20] ARM: dts: ux500: Put CPU cooling properties in a map
 node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-2-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The thermal-zones schema requires cooling-maps to contain map nodes.
Place the CPU cooling association inside map0 so the thermal core can
parse the association. Found with CHECK_DTBS=1.

Fixes: b786a05f6ce4 ("ARM: dts: ux500: Update thermal zone")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 967444e4a618..2682e250b23c 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -98,9 +98,11 @@ cpu-crit {
 			};
 
 			cooling-maps {
-				trip = <&cpu_alert>;
-				cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
-				contribution = <100>;
+				map0 {
+					trip = <&cpu_alert>;
+					cooling-device = <&CPU0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+					contribution = <100>;
+				};
 			};
 		};
 	};

-- 
2.56.1


