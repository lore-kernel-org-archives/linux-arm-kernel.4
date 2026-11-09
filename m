Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969BF606D805
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DH9uFHsX;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=fb/ARR+C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=; b=DH9uFHsXLBC9ZX
	/sn0+5Y50AaK9MFSDQ4LFc7biGsdqId8y+8Mbph51HLZrgNUv81rUqAChOQ1zxNC9xBI5W+V/vNXI
	DnIyl2sb3BmaF4pn8QaySEZ3WhghMtD0LeT9KiR5ZqEiw75LIHRV35CPl4J7lLEs6p/4SP0Bu5R4D
	Q92HQhGPVDsvdSUzmeYcBGzLH3w3hbiF9cNfyV35eqWZk0srSrGCEvcK1aV6xENDV0GPJ6+hBJdjf
	JChJEFYWKROL5m55ygWWSCjpH+FKXU2qOHNICU9q+pghId8yArGrOG0/c+y/YL1W/3SmgGLLjc3HN
	ev64XD210yUEaOiD7NGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPXy-00000000peA-09yy;
	Mon, 09 Nov 2026 13:36:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPXu-00000000pbt-1kCb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:36:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a215e64962so10260185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231384; x=1794836184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
        b=fb/ARR+Cjh0qJS303KLjw+5o40QPeHJtqYnYsrTImOeyBpZZy7NepLb0GjdsRHgIL6
         DznXH2+14ZSaRvhObHZ+6dwzoa8i3fxyuYykbkcp8FbRVve9r6/0xo/ALVBvsFgOQdnN
         kZqp/O3WxzyY+nbv23DDT+4vql2hhHwBRJ27SOZV8EmIdgERuY2G50Ab4qCy9OYhvOEb
         Vpw9OkOuibXpqhn27z7eKQrnH3+l6yBPaSDDdOlxqwLrIa6bFWwk5WloCu+gLkfA8n1X
         nbtAYoz1xpNCimHAJdON5C4S6Gx2IiLo+MOevbgb4t/PkYOcgbku5ZYSzEjKA7MQ/UKE
         2cTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231384; x=1794836184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aMvX3lMVhde+dpD02Zhdv5iVN1tqXxXup7u4GL5+IOk=;
        b=mLPqKKKmahvzdgCem9sZ3xUTH+6Qm+AtCcHFuap5lrJ6Gz5LMu+EFkLwa5FpGGw1nf
         KtB5LUR7OoXveL+tl0GqIu7byUfbYLPh3qcQ6FvakvuowCzZK+YwBHloJTvjHC+ooKTz
         n25vt6hJulSNiOIWaBRqLEbHZ4BRsyFyvmrB1Y4ekK4TfcrF4fzsyzGwynRN26CtU9kX
         hM2tx+OTJSWvUoU/GIWdg9loQA4q02sk8QZwmFK89XDjxBqmI2K6ehSKFK/KLRC5jTJu
         zgbsyi1m/8+L9rln5zDxZ8r522dCQCCso74UnoBc35cRiDlLKFOCbf0g5ewmpKyPrEI2
         K1wA==
X-Forwarded-Encrypted: i=1; AL+hErHnOTowOnbNKy7bOwe98yxPci7tPcp/tRfAavwpxQHTK1+hSzUyyG2DNMFbr3tAIhhc13y9Ku3l1OosZm+hCIAm@lists.infradead.org
X-Gm-Message-State: APuU4Z95nnxFPNDVGPWD4raenFNSCzZMI7Z9stnY6U9lr9OabJ30rcM8
	F8sMRc4wsh0f6DfQfQj93yp3uj119WAUUjqLSevi4KAnJ1QU53ZxnKESZAX2HrgTrYs=
X-Gm-Gg: AYBFou2R/pMhLPOHCv2TTm5rkwMCX5htnSEtd9t8F3Imd4y+aDOZjcRugYN0L3xbDIT
	bmU55SgDsvkT17P3ZaNYC7AX54kNYPeJvYtGbhCfiFa/FVAl0vV1Nh3KbFHMeyA0T69y7kiRUFk
	n58MralV4FEAN04No82eCmEFYzYugKw6ukUQCNchMa0UhrR7nRl83kuKu8gDnYWcN+y3fU3vlg5
	U5jxLy+We4s+9PVjjdJqENuEB2D9Cp3xl0HhmUua4QTMB/dtkdgjPVEm1vEXkWnAZIS/0hoAKvx
	IN+mSuSerPrQsQU9yPXq1QyICFE0w8mi0Clc0wsH1NzLI6dfSWawuaYR/nLa/uSjYnRkQHjRbtd
	TmiDHmofsxGi0XQp6nmDozXrBYE0FgxIyqeHrUtfR7eUWQKTLshGrcGV7toU0q8FOkgrvCQOxPx
	1hJPF8mN33cjDecq2sTK1xTRoTT32FA0XAIXli6XbhNSol+YIqzpFH4ivpX44mzE85RInVIgrad
	WJ7nSROTO2J5yuKbQNm6vrNn04U/nQN5xet7UB4Gl9BkwKKZC7z3noWAexEoeIR9W/If1g64quW
	1J41+zEIhBDXVQLQ8MuFQNO7nEmr6oiK+iRrop7tFEiMdJvs8PqtNTF7Hh49vboKU8/W/rBSE5w
	p28hxVneDvnReQB0r3tHsbb3FvQEVtJH3s6TbSbOWdbEvJ4I34TzhZPCyrlgNeTMQSatxpHCoJR
	DipDBr2eyNOWc6eSt+IkqOI84WWQ==
X-Received: by 2002:a05:600c:a312:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4b94d7632aamr58126985e9.2.1794231384302;
        Mon, 09 Nov 2026 05:36:24 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:23 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 2/6] hwmon: sparx5: separate temperature reading from sensor dispatch
Date: Mon,  9 Nov 2026 14:35:06 +0100
Message-ID: <20261109133609.810876-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053627_447959_AD806D38 
X-CRM114-Status: GOOD (  14.65  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Move temperature conversion into a helper and dispatch reads by sensor
type. Preserve the existing temperature calculation and error handling
in preparation for adding fan monitoring.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- No changes.

 drivers/hwmon/sparx5-temp.c | 54 +++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/sparx5-temp.c b/drivers/hwmon/sparx5-temp.c
index aa91780737446..0fd5c147f8167 100644
--- a/drivers/hwmon/sparx5-temp.c
+++ b/drivers/hwmon/sparx5-temp.c
@@ -37,38 +37,46 @@ static void s5_temp_enable(struct s5_hwmon *hwmon)
 	writel(val, hwmon->base + TEMP_CFG);
 }
 
+static int s5_read_temp(struct s5_hwmon *hwmon, long *temp)
+{
+	int value;
+	u32 stat;
+
+	stat = readl_relaxed(hwmon->base + TEMP_STAT);
+	if (!(stat & TEMP_STAT_VALID))
+		return -EAGAIN;
+	value = stat & TEMP_STAT_TEMP;
+	/*
+	 * From register documentation:
+	 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
+	 */
+	value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
+	/*
+	 * Scale down by 10 from above and multiply by 1000 to
+	 * have millidegrees as specified by the hwmon sysfs
+	 * interface.
+	 */
+	value *= 100;
+	*temp = value;
+
+	return 0;
+}
+
 static int s5_read(struct device *dev, enum hwmon_sensor_types type,
-		   u32 attr, int channel, long *temp)
+		   u32 attr, int channel, long *val)
 {
 	struct s5_hwmon *hwmon = dev_get_drvdata(dev);
-	int rc = 0, value;
-	u32 stat;
 
-	switch (attr) {
-	case hwmon_temp_input:
-		stat = readl_relaxed(hwmon->base + TEMP_STAT);
-		if (!(stat & TEMP_STAT_VALID))
-			return -EAGAIN;
-		value = stat & TEMP_STAT_TEMP;
-		/*
-		 * From register documentation:
-		 * Temp(C) = TEMP_SENSOR_STAT.TEMP / 4096 * 352.2 - 109.4
-		 */
-		value = DIV_ROUND_CLOSEST(value * 3522, 4096) - 1094;
-		/*
-		 * Scale down by 10 from above and multiply by 1000 to
-		 * have millidegrees as specified by the hwmon sysfs
-		 * interface.
-		 */
-		value *= 100;
-		*temp = value;
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input)
+			return s5_read_temp(hwmon, val);
 		break;
 	default:
-		rc = -EOPNOTSUPP;
 		break;
 	}
 
-	return rc;
+	return -EOPNOTSUPP;
 }
 
 static umode_t s5_is_visible(const void *_data, enum hwmon_sensor_types type,
-- 
2.56.0


