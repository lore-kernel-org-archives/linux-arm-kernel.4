Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0C3606A330
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HX/gxzni;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i4wt1GUh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M1PD8j6SB5PHO7xYIjTJBlDsua4DeMv0pZZa5raCSBY=; b=HX/gxzniRp22Ht
	wCFHDxWfYk/Enq5PRZN4tHRjBYP179tIXf/qY9VbRQuBiAUAz+ft+7jYtpon7MfMrCnCSyyAICUN/
	W9P+Dm0UUJP2j04PSkLcXhqRAWZoOOmb8KlGa5w/rfz/CjiGmzw/3sHaY1efq9qZIEdcYA3EC9LUa
	PehtKua78IVqwiqnlECCw9QfUCemqkamEYiRpZZMEC0fPzsthNxDYmFea5bwG1os3Bu7niBZCQCfq
	AD7aoXBkhL95rqsFVM9thu1uV14b39aBjfl++DEJIwMvCL/I1QeKbVLUsMz3O6ZP9n2osIfS09DY2
	a3hvs6eChBwAJ5OlLX4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUBT-0000000G47e-0cBZ;
	Fri, 20 Nov 2026 19:22:07 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUAh-0000000G3tX-37aU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:21:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso625583f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202478; x=1795807278; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1PD8j6SB5PHO7xYIjTJBlDsua4DeMv0pZZa5raCSBY=;
        b=i4wt1GUhMZNgHyxOEhg/v4qqLM1n5zwSyPZSUk04YzIcIRlPh7XlQUPhVyZx4Za5mv
         0OB/KXZXo9ilvkPkIumskG9BcEKjUkontNKVOkxCZrHkOIPaj/d4801wIz+8t8neXwAS
         YogLJLXr5uDAAbXs8oUWwl7D5cL6W/sr4f6L3U6wHxFvvcS1XVAQgI7wvbOAMJLEgdNT
         4yY6PcFd+ym7J38+Y06dPVIq4IMpNd4f2FYv5EabW4xqMI01SJnPrRuFkgPSexrc99nW
         s38YUwnupXRVWh7ECMuNrSTgv6Yas91hPAO5bczP2V1LE4lAfvpnexGpTnU21tfVECZ6
         puEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202478; x=1795807278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1PD8j6SB5PHO7xYIjTJBlDsua4DeMv0pZZa5raCSBY=;
        b=Aa11HPYEMXuy1Xkea2KNIQZlJtVh8de+oCyEmPio/iycvVgZs0ZZZUxjLngMtm2tz2
         z6GOgyfRFqKNmQhxwELH4XHckmlkE3eVnxSYod0Pb92fUC0Ds8ZHNj1nq8QzEO3S1p/w
         jtj3v4AKqeyjsUf+zHGuZ5CsQC93ETwiWZX6N3I+19R0PiB0m4wPHYAF8s318zAtHv99
         2+CSgvXDuPfFAobBDLbqk7nefMfKPExQK1t6z+xYejHyYmYiEn1kP9b9FQwEDRcInk8c
         KW75T7bD76AEsW7joc6f5FYChgBmkH1R+2lqI5g9iJWSvawi+O047JWkFWwwHtuCvAb0
         oRvQ==
X-Forwarded-Encrypted: i=1; AL+hErGYMAIfm/e60EUbkEEKfd0ijAm6YKes18+pUO07vlQLjh5dYDjo/xxdbvdUU2vqZK7ixN1z/OT0rBdvvRQMo8QN@lists.infradead.org
X-Gm-Message-State: APuU4Z/Mq1TXrjIXT2qfAeKW8Xitit+ps15CKZVK1A2hrh3uPVB+Kw9C
	JZ/zWlIrjMjwcKCcflCReTR//Ok7SxtsCWVNiHlOkKET7XqsRfDeSbrf
X-Gm-Gg: AZFdTZdPBJno1d2O5IoZeZMth7Ulm232DCe4i8vSCqSYDaXk0zFaJ+NZg9uRLXtMHaS
	Fa1DvVp8k7Tb9ra80vstN1wiGHGN9dgmk1Ujf9bnqNYwg8dso0zDKkvqjKK+nU8auVlnJIR7Y/z
	4Hkz/rQmTsr2ABEfSfIsaUu7H+Uh++iSsTAsWu/AMX6TQcowI49tn72CZXq0dSGIKHmEwYxWuTz
	gpBt1My0/Apijz/UK7JNYNzbrxKYyyu6tk2TtbA0PbqLXojOa/3egU768HiWoXxe8tR80u5JX4Z
	4RM5Q6h5ca1a1fWPberjDxMRZ9q1nqlauZpnpjZX0p7CszywjvAcrK1PPY4XjfqAaRkfqgCpwSz
	FQtZgov9gbdrQ/+K9OC3iNKQt3PYp2bvP6Im1S3vwY1f6TKNdR3bN2rQGite5b0EH/hkregL4fW
	6A8CHuf41qAtgybpvdOFX9DEKghxFy2jHtQCGQVeZggbFQEowK9l8e07IKxFd7rLBKGU4TAecYL
	SRbziH7tlFLV1PgOTLIB7CxTyFcEuBAgyuy5w1FrIMe0nWFL8z8sLV7yelupc0WUm1ggEAToIah
	E0BodnosxDtkCuXX54F1dpmNlqoWW61ByLGn64aiImUxXZHicK6CJuvux1eoxA==
X-Received: by 2002:adf:e014:0:20b0:4a4:ee9f:a3d9 with SMTP id ffacd0b85a97d-4abb3d2c028mr6479804f8f.16.1795202477805;
        Fri, 20 Nov 2026 11:21:17 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:16 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:51 +0300
Subject: [PATCH 2/6] mfd: zx297520v3: Add socsys to the mfd host driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-2-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2235;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=haBO5T9O8DxAeLkHhQl6vHvSOM2ApNjiaO+2we2t8aM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2WR3OKSSthkwM8w2YGowPMIiV8WT0ADPYEg
 gyX3RTbznaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJkcA/8CdzFthVu8Y5p4obuulOSnPPIeLQWVnC
 UpCUT/7T/s39YYU9rQ4pkMeAqBP7ctNWI21AIp9weT6VcqwQYN5x4QtRqXyFUSYTWQh1UnuZzO/
 uGObg2YzD/iK1GSAHk+30Ia3CYmsHJ7m9KuqJ9V6Mt7NNwSiaUTUKbFnk3FVauzrAYWxtpPnzyD
 d1zZ6BANKQVtMIQZQitU5JruOEKaTAqI1iKobUI8TnrqBXgFVzPxvF1Ik5skRlkWGkcYmxp7lhT
 U4nsJy9P/R0FT1hkJdo4AGdrDTkMjHKOh28vHZTGjwwlAePl7Zbt5PzvmiVIIrsBKDAVvbtx9+x
 veAk1nCXL8il4O1ssjB8MBk3Y47cNzVLeV/eZAYSHXacsk2RGACAL4QciW9wPRMS2g9KPy7p/gR
 83CGrOjaPU2i1O+GQq7VhXn9WXWTreWgQGYpPus75EeoBmZJfbtkQw46XMHxMB/0tpuAp3Gwujh
 5d+56Qd4I6w+xqBvuQAJHBCOlGbKKilro5h9H+P+lcy/DvSCQBcqpsm+V+c249lxUykPTWYbMRc
 SGVEQv0O/w42BhSCtahVA2SwKuD7dzvxDl8DL2+OeVCJt8sRgY2To86kbvtoabvrprLodxo8L+0
 ZLJqtiSbQRMUSLLn3do8j1mpqqou+WNLFwjlh/1DQcrHo23Mh454=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_112122_123310_DAE25E73 
X-CRM114-Status: GOOD (  15.38  )
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This patch adds the parts of the zx297520v3 socsys controller, that can
be exposed via established driver APIs to the MFD host driver, so that
drivers in the respective subsystems can consume them. For now these are
a reset controller for Ethernet and maybe more, and a power domain
controller for USB, GSM and possibly a cryptographic engine.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

This series does not contain a driver for the reset child, as
implementing Ethernet is beyond the scope of the series and needs other
prerequisites (namely pincontrol).
---
 drivers/mfd/zte-zx297520v3-crm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
index 7c29a860be3f..3d542e3dd7b8 100644
--- a/drivers/mfd/zte-zx297520v3-crm.c
+++ b/drivers/mfd/zte-zx297520v3-crm.c
@@ -23,6 +23,7 @@ enum zx_device_type {
 	TYPE_TOPCRM,
 	TYPE_MATRIXCRM,
 	TYPE_LSPCRM,
+	TYPE_SOCSYS,
 };
 
 static const struct mfd_cell zx297520v3_topcrm_cells[] = {
@@ -42,6 +43,11 @@ static const struct mfd_cell zx297520v3_lspcrm_cells[] = {
 	MFD_CELL_NAME("zx297520v3-lspreset"),
 };
 
+static const struct mfd_cell zx297520v3_socsys_cells[] = {
+	MFD_CELL_NAME("zx297520v3-socsys-reset"),
+	MFD_CELL_NAME("zx297520v3-socsys-power"),
+};
+
 static int zx297520v3_crm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -77,6 +83,11 @@ static int zx297520v3_crm_probe(struct platform_device *pdev)
 					     "Failed to deassert reset control\n");
 		break;
 
+	case TYPE_SOCSYS:
+		cells = zx297520v3_socsys_cells;
+		num_cells = ARRAY_SIZE(zx297520v3_socsys_cells);
+		break;
+
 	default:
 		return -ENODEV;
 	}
@@ -88,6 +99,7 @@ static const struct of_device_id of_match_zx297520v3_crm[] = {
 	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)TYPE_TOPCRM },
 	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)TYPE_MATRIXCRM },
 	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)TYPE_LSPCRM },
+	{ .compatible = "zte,zx297520v3-socsys", .data = (void *)TYPE_SOCSYS },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, of_match_zx297520v3_crm);

-- 
2.56.1


