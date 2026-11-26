Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3F5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 22:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NrJjTSVU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Xw4Gt7jN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ml2EExyE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=; b=NrJjTSVU7Tz7AO
	UdOU/bM1g3tS/+eqHIzsbBvwdJYb6Mg3eGWrvSu9i3JHO2dIMYmkhJV7fEKkz6TgEuitO84RaNdnb
	K/UlvVT4LMjDOFxaC4wO7smNjSYj+jjKtYcIn8LfT8sHBABmxavHaWLNRHb+GKIxSyx4zJEonYHIE
	UBPLjCXT3W2PQRAeIvj0WJnnJKrEz5FdJRy4BoCB9MtxskbcG00Cg6QvUU/TaDNCV02wuMI35+lQe
	H1q3ThOysW1OQgHNfRvLmZgs40EWtdXS454oXrFfhnwQMpTv/a77a2OZ+eXa+X+ndI1XpoVEd68cR
	nvYLQdISnbkreP5P8PxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhHG-0000000Ea6h-1c58;
	Thu, 26 Nov 2026 21:45:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhH6-0000000Ea2k-3Tj8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 21:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=; b=Xw4Gt7jNTFwl4imQ+f3R22CqxS
	WukMRSHavMBFER6jlg252gG992djL9tPw2/ovGOj7Bli7Fm9W9jF3FgA996HBKWsUeaDQvqj5JDqK
	ZRsiOIs+2Gawhg3fsKJbFDviyWVi4xoUYIF6I8E04X56a+VEOPoktlX9jduT1Xsz3HkP9Ky8V48dn
	Xc/p0TGX6GEHr8TFUo9xUa6kB2z5DOsTK4xKiXBcQxPWWumJ1GAX7Kgfi7wYba8PDAeCnBbI6jgMH
	IsJM4YIK0pgi00LLg9171V2nL9tSEFX7D2OuC5vRqLtxo+A12+xWHwJnaPcdg5C8wJtKhUIEWhTh7
	AJdSLF0g==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWhGp-0000000CvMJ-2OnD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 21:44:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-497614c95f0so4275669f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 13:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729485; x=1796334285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=;
        b=Ml2EExyEPy4K6y+h24bmjFCfNkOUFXgOdeg6haD9j18GsbeUnOLe/GnyH0FR4ZCzam
         eyeoKKBYm5E1Qs/W06VqEkqHDkcooJSRHKfOwsZ+DXAmkdJzyQdIfmlhf25v1euQ93+y
         pQcwwiyL3r1Ue/z/wUPFlrCeI5utgO2hO2PlhTACf7a+d+OHzdlkAQ75AdFD+rGS8skK
         +xtbrs2tFdx5fx9dbZ6QFBf5rMY3Ym3CMm5U4+A8HTs/qF/AU5+Fi5XXGho9caOBd8SY
         Od4Nk1jB/QA6Ot9cx5zqYPUMzr6EsCOYgxteYfmm8TA8S0wK8Qk+6K73VNrHnBOyaX1V
         FbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729485; x=1796334285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=StNF/DBdYuXhvQKxZ0p2je0tZDOMLysv6mcYjNTNzho=;
        b=wyyvqHRxMTBERuPARGi983zQVJu029Kulk8K4UWgO0lG4Kib88r3upV/AEkGFpsogE
         p/TRBGypiRM44OuqFGrP7XCAFXThhVSe8AYu7epzu8nDCMCrN8eX1x/KA8iQO/JNGhw9
         FUk88KIOpjuNSxj0thkwaeH4BzUETGwlayDk27NpD0T1oyXCio6YOzS8rnP9UE4FiCoK
         P0qnQJjJn3mDm6EwucL+LGzA3pVUB5JJqA2Jv/aMyJpgGJrAJ7T9goawD9sZpgEgN9R6
         j+ALMk0+QUU9wSt4XhSA9/blo0L312/Yo4eDWkLpz6nk/74H4T1Y34YA4PBV9m/2SzV5
         rwWw==
X-Forwarded-Encrypted: i=1; AL+hErEbg7s2ZGtdjur+bohd45+y0SpKFW5jf+K/0FxN5zPuAIdU53A6l5tKuoTw1MY6hXr32flzbL5nESFkCNmiretz@lists.infradead.org
X-Gm-Message-State: APuU4Z8HJ5KMA1vDYG9CI2TnacP3F8iTjo/D/iDZlJ/V25Iq1cVjHPDC
	O4T8FVhl8vZk36AQf5pMwNec9BrBkfSPP+937DvpJ3lZbU9pUd0LzDku
X-Gm-Gg: AZFdTZfh2uzs/XNhfILvDzZN3Iz3LD+QBecMPIslfTWuBD+R0qKhYtfcUwIyDjJKPjL
	vnbtZuWDu4PT9QgxaMhLZGk4rxtMXuMlKZVVucfVUJ45UPVX4ROJpuP+BXe3PjLD6vwBmDSOy7e
	72YNJ42CdGUQ6tEVQaLfXX8IWEYSOwMqibvUNJA+hQQDOcEouRIDxERG35jrkYjph8nMe0RhjAQ
	MhCnDje8kcbUOn9zhMqg7CTQqEoVFpEG5DHYNllxDcN9JJehEOv2KCc5tA16xBwAhAnysbVUo/M
	KemdftQiQBz43QAbaGCE/kYo9lf/0kC+ESlwaAHgu3xyuT8xjA+TzC3IYRKfT84fuG8RWy3FxCq
	FN3XejY2vkO2OYqMZg80S+5Ce4HQNPj9Q+Kj6tTLra9gdC8bPl/dRaatqel9dKXDNZPoWsMdEbW
	1HohFSKPywY3FfFvcwDIoVjVklT3FEdJYEYyPsLJiwwsJjOS7wFLpYZO/fMQzybU3jgXLAf/G1p
	VwDKlJdSsTNrcF9ETwwy9Zwnogv4NM+ljyDLyfgO8fObFRwLC0XIGFsxkPb0Hdxmi7XRKvM3k7o
	ab+eAKjLA+49ILm8LKnx35PcnjiGSOUpd0dDMCJGAWG4xXMAQK2EPHjjFv0W2HEWOzXtJKZqejP
	Ap9meV8cR3o36qwHNr9a5QCchjLb3sCdcsWFZEn4+EyzfKxng2rv7Xsr4lPZAXPzeB4ZSjbOeW9
	yM/tba/25jnprE0FB0zXNtHJh29rPKX0p8LhH0UBiucgHP0lpC5zktNniFB2LYJkVVn4S67xrVK
	WoNQdWu65eJATAnTZQ2pwnPOuEzfDKoFbRkv6g/qg==
X-Received: by 2002:a05:6000:2b8e:b0:4a4:7dd0:2177 with SMTP id ffacd0b85a97d-4abb55185b5mr27115538f8f.49.1795729485342;
        Thu, 26 Nov 2026 13:44:45 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4abbd84e661sm40403963f8f.18.2026.11.26.13.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:45 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	p.zabel@pengutronix.de,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] drm/sun4i: tcon: Request LVDS reset as shared
Date: Thu, 26 Nov 2026 22:44:26 +0100
Message-ID: <20261126214433.3562326-5-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
References: <20261126214433.3562326-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_214449_153668_19CD6C89 
X-CRM114-Status: GOOD (  12.77  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

H616, and other SoCs with the same die like T507, have one LVDS reset
line for both TCON LCDs. The TCON driver requests it exclusively, so the
second TCON LCD fails to get it with -EBUSY and the display pipeline
doesn't come up when both TCON LCDs are enabled.

Request the LVDS reset as shared. The driver only pulses it once in bind
with reset_control_reset(), which is fine for shared resets, since the
reset core triggers it only once.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 20740fa10ce8..77b6026bc895 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1170,8 +1170,11 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 		 *
 		 * If the property is missing, just disable LVDS, and
 		 * print a warning.
+		 *
+		 * The reset is shared, since some SoCs have one LVDS reset
+		 * line for multiple TCONs.
 		 */
-		tcon->lvds_rst = devm_reset_control_get_optional(dev, "lvds");
+		tcon->lvds_rst = devm_reset_control_get_optional_shared(dev, "lvds");
 		if (IS_ERR(tcon->lvds_rst)) {
 			dev_err(dev, "Couldn't get our reset line\n");
 			return PTR_ERR(tcon->lvds_rst);
-- 
2.43.0


