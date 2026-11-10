Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9351B60A2615
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 21:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nMga0WI+;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nglNWzqG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3yHxwmGIP00UkCKgkChB+u5krh4ioA+qIXr0cmR6Xmc=; b=nMga0WI+M6bQFI
	TflAJBHsSF9TAx1LF+HApbXu80L2yo+WpelS/P1VHA+JaX3HqiF5jbPIuLgDLZaQyPpQObEoMikU2
	DRY9gbCynIekf39mgXTGvxf+YZQGBue/ayWchKFryzx2ZuiQDMfPMJkgsiv2nAX4b2SSCQ33/3p5N
	Hx2OTEMEosElnTqOk7AGEaSx6dFJRXxq6l3ZzCiXqYBsFrlhQgonjd0rJwIo6GF1oSum2W/AgGGjk
	1uY7auw8rVmcSw2BOpG/ingWgV7pxBxeSMASz9SlQQLSF93Fw+fUqWG6I0Lv8lw3KX/XYf5Gyv4zN
	f2FtNU08+aiNGLMGXJbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtpS-000000056Hs-24tL;
	Tue, 10 Nov 2026 21:56:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQtpN-000000056Cc-13UJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 21:56:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso18820445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 13:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347787; x=1794952587; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3yHxwmGIP00UkCKgkChB+u5krh4ioA+qIXr0cmR6Xmc=;
        b=nglNWzqGhApMVX+PtofXp3+wfHGV5dWZ7lAtKF+jeVuHwU156EkLAWTyvXuncsVUE9
         254X7SIskNqukVQH1LF75qdxghjKvnAKSmXmiBbxSmWYHLicXgfoB/5+PP4+d/r/7nm0
         iy8kvHmbcDBlHl0IyV00+yK52KyRYKXZ89DHw0/ZYV3VSLqh3LQafC+gR92IlZUlvM2I
         xoo+J49CSPcfLaXZWvIZAonNLtlK4jCNlzsjaQraaHOfG2XHz3Llz8odJSx1DLqqT7kG
         veFpDl0KrBlkh+3+4gcstK4btCpBnLQFIGKvPvwLV5PAJkkUtiffsKnIscFZ1rkPj0J2
         LbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347787; x=1794952587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3yHxwmGIP00UkCKgkChB+u5krh4ioA+qIXr0cmR6Xmc=;
        b=svVQkplZvedfpuxOhJFZHzf2xIW64gYbEH4CPlCVUgIiUPFfTZciRmlWF1qKZjLfX8
         p1EnMkrZOPGbseEZMN+4f0etCW3CkD1EEs88hjDvzHwcIuI8kGfNUATvGpN3+oE9WJo6
         G2wDZRl4VfhJFxQ+Cb3/6GK2vuOnq/vVV3RMmAtWyig8UxBTbLAY9Xvcznwf8ceofTeg
         zug9mjK+VC2wZB1cUXZ4vl94qDWmdOpYEDmk8A1FBkNZvNMo8gf/cVMg03mo98D6EcN3
         kSfhT8fNtyX0kAgM4F/bw0Qii3wlg56FqtlLkcwjbQlviTXWpKxmtqOShpXMe/zXIabe
         PV0Q==
X-Forwarded-Encrypted: i=1; AL+hErHgkMNLO3K9JFGQ6mdh9qxV9sTrNROYAQ2j1/kzBW57jxFX7OIR0oVl6yWnPuO0jqZ3Hc3Y9K521XbBKoaCFkAS@lists.infradead.org
X-Gm-Message-State: APuU4Z8Qpk/T43wx8Lq2Mv2x5I0ZhVg2ukMzEmrAmWlwWBNOEwDsEbt3
	Ww41rBg8gCQDU4tTpr2QT3HS7wIuJs0MgCz066EyK1Jj6U5ttERZpePv/JLBeq3+Aeg=
X-Gm-Gg: AYBFou0GVUNZGXWRHLtfBSthgCGmwvVDaEfeSCdM1i0P3LfAP5ZJLoAL48wTcqlL3hz
	7a46bls5j1WBbR8gb8jKR4pFcK7cPIgB8aavusXieHDAnoAWKQh2OvHHj+/UMLWgqYDApbhWbGB
	a13GbbvGwN03CqKenvIx48lhooDU2OPk7MCH/6zJkes5nxVEluj5U4X+AoNp64qbPs9kiZH8D1m
	Uz8sX/g/n4c878W0bfee4uwC20Tw3Ng2fLITTT2R5dKlDK5GBikIGL9RPwtuNCxcwJyYnHoG1+f
	YgP3QuXx3Afo4UsiLfAlaboVd56SwIQabPG1hD80DAqvC2JKMFSI28tIPhYOcmg5NlTO7AF6gfd
	393lL5fFKqpPryyu1CfzoTAo1hXp6Q7n/+N4b0DZRMaDIJEWtuXKrgeJ/WJYR38e4VzJl/wGs4Y
	asE7b6a9Z04gQx8TKHVNhGAZ/g/IdPmLaZfIrTHV1G8WH2WM/ftcsnZ1oSTBG0YEwgkXeCyhrXi
	2ZXx6tsEueds1pK5/k2vRfqDYwZCcof2vOgHIAgsS+D6CIF2jgBY88dt/FC7Iak71oJePKrfeyM
	9Q4LvVlLlfu+JSEg7X1VKICqMeAHGgMIEA==
X-Received: by 2002:a05:600c:83cf:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4ba0935cc7fmr6834225e9.11.1794347787385;
        Tue, 10 Nov 2026 13:56:27 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fe9357sm104638115e9.9.2026.11.10.13.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:26 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 15/20] mfd: Use named initializers for platform_device_id array
Date: Tue, 10 Nov 2026 22:54:40 +0100
Message-ID: <19b9b030217016ca7f4b0d9d9fc9ab915a8963f2.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2610; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=GtAPN5RJoz25rnsaMIkCchglusimHC6pNuburCmgGRg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85LIi8QM3sjZgogwtug7vcVX0SJ3+X0vaVym+ L1HdZB2sE+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSyAAKCRCPgPtYfRL+ TmYhCACII9zsLdrs/XbNbp5plwyC1+ueOodgi90o8Ine575DtEGWJWFKxuOyV3MjOikDIUogOsG MzJmZ24/rTI7I4xwYZlkYEAqHwAGYW8EMjWiQpKt5XO8wsAFYIxFSL8LTY71t74mgHbWDhNI+8w 2TxE30D1nc84pn3rOgSAECQGKJdmFQ2ypL3quSOgUzff6KmjPytCYfR+0y/C9BOwmXcw28lKsDc mkicJ29/gVaaf9mRn6Qtjl2QU/WU4d3KO3rTHSnwNDd0A7kyku+SPqvzMsCcRe+ONI4Alw7KzMt c3E3M48lKlrj231S7RpIbK24VOHABh3tP5EwFKaeE7IzoPbd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_135629_358091_9B3B75A8 
X-CRM114-Status: GOOD (  18.60  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
platform_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Also drop a tailing comma after a list terminator to match the common
style for these device-id arrays.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/ab8500-core.c | 8 ++++----
 drivers/mfd/cros_ec_dev.c | 2 +-
 drivers/mfd/mt6397-core.c | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index d5602b2f4a0e..8638fc8472f7 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1252,10 +1252,10 @@ static int ab8500_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id ab8500_id[] = {
-	{ "ab8500-core", AB8500_VERSION_AB8500 },
-	{ "ab8505-core", AB8500_VERSION_AB8505 },
-	{ "ab9540-i2c", AB8500_VERSION_AB9540 },
-	{ "ab8540-i2c", AB8500_VERSION_AB8540 },
+	{ .name = "ab8500-core", .driver_data = AB8500_VERSION_AB8500 },
+	{ .name = "ab8505-core", .driver_data = AB8500_VERSION_AB8505 },
+	{ .name = "ab9540-i2c", .driver_data = AB8500_VERSION_AB9540 },
+	{ .name = "ab8540-i2c", .driver_data = AB8500_VERSION_AB8540 },
 	{ }
 };
 
diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
index 96aac158fd8b..3c7e7f1efd0f 100644
--- a/drivers/mfd/cros_ec_dev.c
+++ b/drivers/mfd/cros_ec_dev.c
@@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id cros_ec_id[] = {
-	{ DRV_NAME },
+	{ .name = DRV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, cros_ec_id);
diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index e74936ac206f..385121867da5 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -435,8 +435,8 @@ static const struct of_device_id mt6397_of_match[] = {
 MODULE_DEVICE_TABLE(of, mt6397_of_match);
 
 static const struct platform_device_id mt6397_id[] = {
-	{ "mt6397" },
-	{ },
+	{ .name = "mt6397" },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, mt6397_id);
 
-- 
2.56.0.rc1


