Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3757606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 09:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tdR0rqDs;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=sQe+0ic3;
	dkim=fail reason="signature verification failed" header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=KNavj01W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=; b=tdR0rqDsWEGIj+rbYl4ANuEU/O
	Zl+QVWEMA1+YVCv2oanlh2EirhAigiKptiD3xmP2WXPvTInKWA2dEKcXIMW2TkkGvYL2x3OQR/GsS
	5aZ812ugV2GmoNmNd1F0j3xf31vyEOLOiMfITNcLPQ9A1kgMIV1IP9VVsDl8PO56PaSC9JeIwp02+
	QwfR//DA/bXWJQOszbQVIxEJ8LigjqDgx4yMrpFJIWg3bN7XAqtm7PMzHno04QX+R4lwoExPZqO7o
	rEF7+/1qMMv+vErIqhFZt5lPKvhQHWU3fD0gxwK7w+KrmQSSVvqxXjecBiyjRyVxIBVaIqAcP21wl
	NCTBi9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgyy-0000000GyIk-1wRO;
	Sat, 21 Nov 2026 09:02:04 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgyv-0000000GyH5-2xWd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 09:02:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795251715; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VMZB0uNEfphvUQJLdhbzgbA9D4G7EnoVsE/YnkDlIfNVF1uTDRezRNkAaW/m5bfmYk
    1L+Su+eEOkp5QEZ7o9y2DIInqf3MP+SJa8WtH/KszbPm/DxsebcxNHDFD3HYvCLBvI1j
    7CGW3sdHjBUj6zzDE1qt9TTIZD4TnMHRTTTitXGyajN1TNnUwoc9poMYs3IPJICfMP6A
    oQ4cU+j2DuxmAxzEIwmwhpiTeoV54l/eW2x4ZcnBq4ymJ/vCfa8TLQOylkE0k/tJ9tPY
    wxy8RV3Qm9vxfxAckxwQ6nJ3QbCyFx9x46+ORaFwNmtj/SeGpy4IOGRPp6QBAFVMpD5x
    ZVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795251715;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
    b=D7cYI7oWLRzopB0Y6wQYlN8JlspdqbPWdqGPbaVOKcIPtm1wQG8rsVdBMSz/bspIZb
    0eHIqMLhExfEBXbp6AomU4yyzeZJ+cpDOTRtLKoiszyt/uqwPkTXJkjYVgATZzAha+yd
    baCSB/Wy4qj+QLieBA7jo2vGGbIyOJBd1gXFei3sgHrkxbf9ZVQljRnMkjaEFd/SiZA6
    Nf/wwaE8bw0U7NTfOmUd1GFJPmvXw9AdJzC4DJmBpfnOZ8ZOdg6YBKIZohPPR6jA5EFH
    4KGnxCE+Ohjs3H67LVcqHn7t7sIcQw79yF8UP7JcnPlMHneJWeb+ieMe5p6x7d/1PgnL
    MK4w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795251715;
    s=strato-dkim-0002; d=ommer.net;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
    b=sQe+0ic3JZ2lHGhQm93Jw5bMi4H5T/o7VzaN6ESH/26kU4aBcBaGfTg7elj/UzYoJJ
    3GNDTxJolqSEnB3M8fm7mMCSjAydaODdD2enRZGMw/78o7eVnxzmS/MoYXcjY52pM6kc
    RqolROEy7X24k45h4RUSPI3HdeNOzLqeLPEx/C5iE94MrwYhaDYbzELmTO2Fdg9rzlLJ
    Gh92PUh6KM2RlwIfN/bBCkx0dzqR0Jl1h+R663WN8OAzCoIeCQTjV0ZW6lBEqIwI0p4E
    PizfqGrOqhW6HDFWU8Kh26FxgdSQElKcsnRakJbak6xJmnWXcnB53hULIG6hsppmmrnZ
    mesA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795251715;
    s=strato-dkim-0003; d=ommer.net;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
    b=KNavj01WbiMmyb/12DVzWKSIomR3BLy28bZmH41coIYc8eX1xWHyBoLyMkXjPq8EJ5
    NvCOXpJK8kpnqxFsUuAQ==
X-RZG-AUTH: ":JGkKZ0mIdPJLfj3rk5MOrv6kH/tvwFubxUqMvsWOyVXJkOABZnPqvKUstHY8FQgi4y8Fiu3j5HL2zuVyTQ9NDYXzNSFFaQ=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id n2f42d2AL91tVCD
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 21 Nov 2026 10:01:55 +0100 (CET)
From: Henri Ommer <henri@ommer.net>
To: krzk+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henri Ommer <henri@ommer.net>
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: samsung-boards: Add Samsung a20e
Date: Sat, 21 Nov 2026 10:01:45 +0100
Message-ID: <20261121090146.39170-2-henri@ommer.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121090146.39170-1-henri@ommer.net>
References: <20261121090146.39170-1-henri@ommer.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_010202_001110_64C8FA22 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Adds devicetree bindings for the Samsung Galaxy A20e (SM-A202F)

Signed-off-by: Henri Ommer <henri@ommer.net>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 6f3e02a63..49e9cfaca 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -227,6 +227,7 @@ properties:
       - description: Exynos7885 based boards
         items:
           - enum:
+              - samsung,a20e                    # Samsung Galaxy A20e (2019)
               - samsung,gta3xllte               # Samsung Galaxy Tab A 10.1 (2019, 4G)
               - samsung,jackpotlte              # Samsung Galaxy A8 (2018)
           - const: samsung,exynos7885
-- 
2.56.0


