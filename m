Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469DA606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 08:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZEKHlz+P;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=rIpl9TiF;
	dkim=fail reason="signature verification failed" header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=8pNMaZuV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=; b=ZEKHlz+Pun2LMSfy1IdT9VA2Bf
	b4ArzheZD8JagrMQIMxU5eo5Fc61KL/XtKd5iZJjQDTH27rgsQ/WR/Cf0eMTW5Bu2XNaGtrog/Ict
	oHZ221Rp9j214MzkXgJVY91SoPl3De7Yc/Nx6BuUc011dxZOgA5B/GQx50uzM4z/XSfyf/+/0HsYV
	pchZq4zDSQS0hMX0orZPLQCTpXw1O+2TqWNlmzUKginKKXdNqEb3xrn+FdNAgpul/9aHkCxPirlYR
	3j0+GzzKNrST/kbIJeKWvXDSnnCs7C+m1Ev0EP2V8JENDFvxO42ewVfxQKkhaGPAmRuwn71B8aFJ6
	vcI54vHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgOj-0000000GvSm-2dlg;
	Sat, 21 Nov 2026 08:24:37 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgOg-0000000GvRn-1Yt2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 08:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795249462; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lnmvB0B7fgfkpoLwn9qfXt30ZhFgxdVccwW7jlmLgpQe27YG5YaI8nwSbtsmLrIqLa
    LC5MYP5Z3tJxAZywSWklVG6b/G+CVPcbcF4zI3T9laJxOU/AcFjcK07gNNodBgPEoTl5
    6S4gnilBE83Ols9RpZmQ4TQ6IvUs5JBSPqgFnZiLDWNkLIQAjLUCjkSaiaaw2DplCT2r
    EDUpuP/gUF6dVzc9Cb+OPIw7RojnjOtZMlhkevZyhtd2NY6hYv4k6eBoe+BgsDlB7t+0
    imkSw1HL/+e6gBXYmjdPbipZLrRH9oJTruQ+GhzSPit2+wCkJXMhf3a5m3nKb94tws4X
    ufYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795249462;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
    b=pYZm6J14kuRzqZQkfQCYuStkt65WLbUcNRHRE1cAvQtK1S/w3dxAhQ4owZKq9UF2j8
    TecYBSrjHBe8FT6o8OY9OP/jPw9xZa/KSK2Gh1MgIZBLAUulFixIwN6icZ+G7DtFEnFb
    TwYDkMXnfBPUHE98KSdoQtgTIBeetaT0ifjZRkBg6hPNK8kfRXiK3a7In4ZyxYNU0dks
    cZDtp5fUeXy7VtgIubJ4033fp0iqKNC/GmYveNjV3qSuRrVfiyLy/PXrdSJnw/DKkexX
    2XJYQVBm5eDt+NKQMOUa83KFQaPjnq/LoxYhRkuuZ/wbqw+Yp1c8LyQ5/h4UZVhl/L5R
    WdcQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795249462;
    s=strato-dkim-0002; d=ommer.net;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
    b=rIpl9TiFblImfUPWqsGpMBxyRT6J2hiyEf4OkhyXBoF2ts5w14Ui1P5W1ZcEOELAq/
    k+K0qYw2QOxccJmkQBX/3fSAq2wP0CwYEksFrgEfbtcA8x7oOPF5u1dQkytoKM95zPn3
    eejkxRMwae5tZYFNuEUqaZ33iDk2im8Vf9NJr08et4cvtLavKsbwEXBGQ6iqfqf3jjsZ
    RRA92hkzIzbwiMB23XyMFAz2o1ZU/51+ViHhW8y6fk8AhE9UQkHHOCO3ReVai3rkOdKK
    VgEwkDjtE60Ntvi8Bri2rFCjaDGJyVY1N1xxcM4uzASvccbjdGmT0Mw8CJyxJCfKaUNP
    H6Jg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795249462;
    s=strato-dkim-0003; d=ommer.net;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=NlKzHVz3Dy8D40dZPHNRY0wUOPTt50j8t0RAlCaU4dI=;
    b=8pNMaZuV7u4xeNvSYV/+WozftHLDhsUVyYKSzLMGavdDFa3S2KDKk/dj6cBDw8zJ2o
    RToxYz770szmfmTdj7AA==
X-RZG-AUTH: ":JGkKZ0mIdPJLfj3rk5MOrv6kH/tvwFubxUqMvsWOyVXJkOABZnPqvKUstHY8FQgi4y8Fiu3j5HL2zuVyTQ9NDYXzNSFFaQ=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id n2f42d2AL8OLV5B
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 21 Nov 2026 09:24:21 +0100 (CET)
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
Subject: [PATCH 1/2] dt-bindings: arm: samsung: samsung-boards: Add bindings for a20e/SM-A202F
Date: Sat, 21 Nov 2026 09:24:03 +0100
Message-ID: <20261121082404.24864-2-henri@ommer.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261121082404.24864-1-henri@ommer.net>
References: <20261121082404.24864-1-henri@ommer.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_002434_668033_AFAC656A 
X-CRM114-Status: UNSURE (   8.39  )
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


