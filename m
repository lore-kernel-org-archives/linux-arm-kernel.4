Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C9F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gso1WdR7;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=mzxMMH3N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uOiKjWCeIGbdcDyUIMYzJmGrVI5/CRaIXG/xuOpEkMo=; b=gso1WdR7/IfSTp
	mW/4WRcj7eWXYpkEH8NVDqJZ9i21fQFjTa10/7jUsAP9V7ToVcGpDL65peqPv4ScEI4N1qXfbp3V1
	pe+ynyC+BlFsNU65GifR5TpkPTFaiiznoP92RTHq42yTvDO8jKi54rhkNAKsUT886hkoF9Z9+Wip9
	zSWknUg54iZUMRINDFu66VXiI+9nJPzghZFm3zArz7436Clv5CACN4UaCgwBipzDydQt0sm7Iv976
	Xti2F32dzi2wrysxcutVjQ4xIv/YsuD46kmbHQ5T0hnW1u/Nnb039rg/iwBqPo+gQ+Wyv+eJ3ORWp
	0Yld2Lsdg3TS6qtDuUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpEs-0000000CVE9-1x87;
	Fri, 13 Nov 2026 11:14:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpEj-0000000CV9m-0I8J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:14:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so11905815e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794568467; x=1795173267; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uOiKjWCeIGbdcDyUIMYzJmGrVI5/CRaIXG/xuOpEkMo=;
        b=mzxMMH3NnCxLpnzbceNzoxTS74xEvSGTKrAGeIygQ76J7yj3jkhOhSGMa6Xeevwdmm
         eSQKsdpKwQX1wPZZ5TSIf9EKuvzRo8ACUsmuR9xFO1hLyMkOeg+77rrTtfW+eBbrIr3r
         3u1P675WMSZFFqwF9IVMmj18mGSk3LV9+aqX/UDCQYb61laKsGT3mBVb5dzbk98MoHKR
         SeiOsxzsJUmY2uMVZe46yVFGXQJttS4ADkAuj0+mFitCyDPnF6MYMvYME6kyOaI9n+sx
         BO9LoMN1dweQ0TXXzMivW2b8v1Kc/SKUqiEa1iCIqiEovRNtKB8n/oI9BKG1mCH9EKBK
         1OGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794568467; x=1795173267;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uOiKjWCeIGbdcDyUIMYzJmGrVI5/CRaIXG/xuOpEkMo=;
        b=pvzrbBLVNHG4p7hyRYR6wFIBOcMnLeAwiK1u97giHyrbfnPbH3BEyI9cCRE9lids0m
         p43sqjeu4ahUYz0v5jieCJ0MHB3LJXv+bHDfYoI7mAsu0KI+BrKXLXzy4JNt2BAvyKCK
         Q2dewiG5SFv0ioJeD9BUTbPZB08eRTpUAV2dvIgOAZRJcWuOGkga/IPxF5N6Eml6E0Qb
         ciaPTMOorHG0pKbAlV57G2dFCzM0XQ5MOnCkQWq0lSoHIZjNYDq0TQRVNUu8nDn5UtGS
         m8tNKCmGj0gdpqbYbXKK+QQt+O4H5779cp0JQ6ZPCHPE5hx98zVv8keWZzFL4w/TCx2Z
         rgxw==
X-Forwarded-Encrypted: i=1; AL+hErGaz0sSuztTA59S+L9hOPDJvtaK2klUqdTjPDQUezpOvqVOG1G5VdoJnbiAviFi2lEqQiLvYmdq2uclkqsNA40l@lists.infradead.org
X-Gm-Message-State: APuU4Z9KE+S2hX4EA0JdVGmXZhjcy6+TVfwW24taf26ZWDIiaTtM3But
	nAzOCtrnJ48u8nWLECC/y31OxDw8LCpgM9xFFYYIbHR99R7BaE86QtRYt4C3CsuIKj4=
X-Gm-Gg: AYBFou2lQ4o10DB9M4EInN0DQhT6GPQ6toOYiTZl0S+RQQkWg8vNELMIoIb4cigCxsQ
	1UUukzU839Vp3iofghVaKqLwfug4M8fi5iKKFQOMM1FHcjK56OMoq2lUnaXSOZGMYfc5c3f9T5c
	0Jj/SnNr7MHPI6DCZ/biGpPBPAOIjTwfPgu3YAegVROV5a0i5PCCI5T5ORU7CAs3o+6Gvi7PW5S
	nsQ31idR0rHNA07zPG0RwbTGOHzT4PxS4gywJorbpx6GvWUFGlHqYbluBsE8RcBLT5YzmHXvitA
	ApS8l2l5mGH4+Ty+h/J1eQNUpDVYHpq8OJ9rg7PzAQ4QyVHacXBWMU8CT/6zjRItH15bRpNqIJi
	qqInqvotdmrYL0wvgpEuUrVvVQKUZfv18kSN1HqB39SpGW42ZAeE2qI6y1B2YVlDNkHfcpR/FRg
	e7do1JFQYgP5KPONWB9e5N9TqJEHP6+Q96OhmH0evdWdrdUWYsQsu5q1yxlwSQuM5n93dMJ4FVb
	amR+K6GYj+gpBI4EjIxw2gZVt9YRbcC+Z6noZl1WImQiUVQ50Z0WskIRUwBRzj9RzAKd7QH7jjo
	ZqxNHgy9vOCJc8AxL0NCi6UhvTb8ep+eYO+4R71W2tha3RvlnPBjKJLobIqKXcO/KkT+NDXkhhy
	yTvvatJ1ZhUbiNXDnGw==
X-Received: by 2002:a05:600c:b86:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb55ac4030mr44714045e9.34.1794568467188;
        Fri, 13 Nov 2026 03:14:27 -0800 (PST)
Received: from localhost (p200300f65f19a904278f3f81ea855105.dip0.t-ipconnect.de. [2003:f6:5f19:a904:278f:3f81:ea85:5105])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb4e2adf53sm144648515e9.15.2026.11.13.03.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:14:26 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Ira Weiny <iweiny@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zhang Rui <rui.zhang@intel.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Gergo Koteles <soyer@irl.hu>,
	Jakob Riemenschneider <riemenschneiderjakob@gmail.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nvdimm@lists.linux.dev,
	linux-pci@vger.kernel.org
Subject: [PATCH v1 1/4] ACPI: Unify acpi_device_id list terminators
Date: Fri, 13 Nov 2026 12:13:57 +0100
Message-ID: <b1353edf17242560d8670e6fe9b76de74a9be822.1794567577.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794567577.git.ukleinek@kernel.org>
References: <cover.1794567577.git.ukleinek@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14980; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=l+TGEeumZ/mUBt7nv7kiWmafNhx1hYIBPeLVaGdgLHI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9vD3kSJPjT8ktQm5Il0eP76oxHfx6M7JIwp0k tswKEtcnm+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavbw9wAKCRCPgPtYfRL+ ThGkB/9iFFrVt1kPG7QG9fFwhNNb0XIiadFldCxkWD61QQ55YGwGAeR1PGIYAkQ0P0xfGz5hc9K GcBULBRgZA2YNUxbMNTrAc9g7OEelz+VUFE3GUutWjSnjIs8dHAI8m48Wih5ELxL0k8yr2ZL8A0 bTTGUGmwfsAl7vsWbsWy0OWpsa4/qZKs07G12bSMaLAKvx8yVYjdShwAFeKrR0Qv+M23xG5Dbpm A2vxhJntAMxn6PqaLb2r7rbw91lNhCcKNKDA8hlqoCLiKurDMUM4kTs3SSLto6xg491zZIxtnyL RSKVCMVkjiar3TOym5Q2Bv3V0YzdU61nSVushUDd0f/j58eN
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_031429_382737_47778E21 
X-CRM114-Status: GOOD (  17.17  )
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

Consistenly use an empty initializer with no trailing , for the list
terminator. This doesn't introduce any changes to the compiled result of
the modified drivers. Note that the first member of struct
acpi_device_id is a char[] and not a pointer, so an explicit "" is
eqivalent to the default initialisation.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/acpi/ac.c                 | 2 +-
 drivers/acpi/acpi_memhotplug.c    | 2 +-
 drivers/acpi/acpi_pad.c           | 2 +-
 drivers/acpi/acpi_pnp.c           | 2 +-
 drivers/acpi/acpi_tad.c           | 2 +-
 drivers/acpi/arm64/amba.c         | 2 +-
 drivers/acpi/battery.c            | 2 +-
 drivers/acpi/button.c             | 2 +-
 drivers/acpi/container.c          | 2 +-
 drivers/acpi/dptf/dptf_pch_fivr.c | 2 +-
 drivers/acpi/dptf/dptf_power.c    | 2 +-
 drivers/acpi/ec.c                 | 2 +-
 drivers/acpi/evged.c              | 2 +-
 drivers/acpi/fan_core.c           | 2 +-
 drivers/acpi/hed.c                | 2 +-
 drivers/acpi/nfit/core.c          | 2 +-
 drivers/acpi/pci_link.c           | 2 +-
 drivers/acpi/pci_root.c           | 2 +-
 drivers/acpi/pfr_telemetry.c      | 2 +-
 drivers/acpi/pfr_update.c         | 2 +-
 drivers/acpi/processor_driver.c   | 2 +-
 drivers/acpi/sbs.c                | 2 +-
 drivers/acpi/sbshc.c              | 2 +-
 drivers/acpi/scan.c               | 8 ++++----
 drivers/acpi/thermal.c            | 2 +-
 drivers/acpi/tiny-power-button.c  | 2 +-
 drivers/acpi/x86/s2idle.c         | 4 ++--
 drivers/acpi/x86/utils.c          | 4 ++--
 include/linux/acpi.h              | 2 +-
 29 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/acpi/ac.c b/drivers/acpi/ac.c
index 14a06c9c6380..f629fcd662f9 100644
--- a/drivers/acpi/ac.c
+++ b/drivers/acpi/ac.c
@@ -33,7 +33,7 @@ MODULE_LICENSE("GPL");
 
 static const struct acpi_device_id ac_device_ids[] = {
 	{"ACPI0003", 0},
-	{"", 0},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ac_device_ids);
 
diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
index 1d7dfe4ee9a6..bb1c380b1ffb 100644
--- a/drivers/acpi/acpi_memhotplug.c
+++ b/drivers/acpi/acpi_memhotplug.c
@@ -22,7 +22,7 @@
 
 static const struct acpi_device_id memory_device_ids[] = {
 	{ACPI_MEMORY_DEVICE_HID, 0},
-	{"", 0},
+	{ }
 };
 
 #ifdef CONFIG_ACPI_HOTPLUG_MEMORY
diff --git a/drivers/acpi/acpi_pad.c b/drivers/acpi/acpi_pad.c
index dc6d0091d17c..edd4226a353e 100644
--- a/drivers/acpi/acpi_pad.c
+++ b/drivers/acpi/acpi_pad.c
@@ -439,7 +439,7 @@ static void acpi_pad_remove(struct platform_device *pdev)
 
 static const struct acpi_device_id pad_device_ids[] = {
 	{"ACPI000C", 0},
-	{"", 0},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, pad_device_ids);
 
diff --git a/drivers/acpi/acpi_pnp.c b/drivers/acpi/acpi_pnp.c
index da886923b008..ea9858e00238 100644
--- a/drivers/acpi/acpi_pnp.c
+++ b/drivers/acpi/acpi_pnp.c
@@ -301,7 +301,7 @@ static const struct acpi_device_id acpi_pnp_device_ids[] = {
 	/* snd-opl3sa2-pnpbios */
 	{"YMH0021"},
 	{"NMX2210"},		/* Gateway Solo 2500 */
-	{""},
+	{ }
 };
 
 static bool matching_id(const char *idstr, const char *list_id)
diff --git a/drivers/acpi/acpi_tad.c b/drivers/acpi/acpi_tad.c
index 5fcb0bee3710..bd8bdf7b1a4f 100644
--- a/drivers/acpi/acpi_tad.c
+++ b/drivers/acpi/acpi_tad.c
@@ -896,7 +896,7 @@ static int acpi_tad_probe(struct platform_device *pdev)
 
 static const struct acpi_device_id acpi_tad_ids[] = {
 	{"ACPI000E", 0},
-	{}
+	{ }
 };
 
 static struct platform_driver acpi_tad_driver = {
diff --git a/drivers/acpi/arm64/amba.c b/drivers/acpi/arm64/amba.c
index 7ee431d9464a..34381ca72add 100644
--- a/drivers/acpi/arm64/amba.c
+++ b/drivers/acpi/arm64/amba.c
@@ -22,7 +22,7 @@
 static const struct acpi_device_id amba_id_list[] = {
 	{"ARMH0061", 0}, /* PL061 GPIO Device */
 	{"ARMH0330", 0}, /* ARM DMA Controller DMA-330 */
-	{"", 0},
+	{ }
 };
 
 static void amba_register_dummy_clk(void)
diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
index 1db23627addf..29432de93fc6 100644
--- a/drivers/acpi/battery.c
+++ b/drivers/acpi/battery.c
@@ -68,7 +68,7 @@ static const struct acpi_device_id battery_device_ids[] = {
 	/* Microsoft Surface Go 3 */
 	{"MSHW0146", 0},
 
-	{"", 0},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, battery_device_ids);
diff --git a/drivers/acpi/button.c b/drivers/acpi/button.c
index 91a4e9698f7a..73a9efe07160 100644
--- a/drivers/acpi/button.c
+++ b/drivers/acpi/button.c
@@ -65,7 +65,7 @@ static const struct acpi_device_id button_device_ids[] = {
 	{ACPI_BUTTON_HID_SLEEPF, ACPI_BUTTON_TYPE_SLEEP},
 	{ACPI_BUTTON_HID_POWER, ACPI_BUTTON_TYPE_POWER},
 	{ACPI_BUTTON_HID_POWERF, ACPI_BUTTON_TYPE_POWER},
-	{"", 0},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, button_device_ids);
 
diff --git a/drivers/acpi/container.c b/drivers/acpi/container.c
index f138a433554a..3a3b18d62a93 100644
--- a/drivers/acpi/container.c
+++ b/drivers/acpi/container.c
@@ -18,7 +18,7 @@ static const struct acpi_device_id container_device_ids[] = {
 	{"ACPI0004", 0},
 	{"PNP0A05", 0},
 	{"PNP0A06", 0},
-	{"", 0},
+	{ }
 };
 
 #ifdef CONFIG_ACPI_CONTAINER
diff --git a/drivers/acpi/dptf/dptf_pch_fivr.c b/drivers/acpi/dptf/dptf_pch_fivr.c
index 8d7e555929d3..1e41bea6e00d 100644
--- a/drivers/acpi/dptf/dptf_pch_fivr.c
+++ b/drivers/acpi/dptf/dptf_pch_fivr.c
@@ -153,7 +153,7 @@ static const struct acpi_device_id pch_fivr_device_ids[] = {
 	{"INTC106B", 0},
 	{"INTC10A3", 0},
 	{"INTC10D7", 0},
-	{"", 0},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, pch_fivr_device_ids);
 
diff --git a/drivers/acpi/dptf/dptf_power.c b/drivers/acpi/dptf/dptf_power.c
index 55ccbb8ddbe3..5b2f2cf13b5b 100644
--- a/drivers/acpi/dptf/dptf_power.c
+++ b/drivers/acpi/dptf/dptf_power.c
@@ -242,7 +242,7 @@ static const struct acpi_device_id int3407_device_ids[] = {
 	{"INTC1101", 0},
 	{"INTC10F7", 0},
 	{"INTC10F8", 0},
-	{"", 0},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, int3407_device_ids);
 
diff --git a/drivers/acpi/ec.c b/drivers/acpi/ec.c
index db24a9a252a8..611c616f4927 100644
--- a/drivers/acpi/ec.c
+++ b/drivers/acpi/ec.c
@@ -1808,7 +1808,7 @@ ec_parse_io_ports(struct acpi_resource *resource, void *context)
 static const struct acpi_device_id ec_device_ids[] = {
 	{"PNP0C09", 0},
 	{ACPI_ECDT_HID, 0},
-	{"", 0},
+	{ }
 };
 
 /*
diff --git a/drivers/acpi/evged.c b/drivers/acpi/evged.c
index b79ee3f5c1c3..e8c60f902846 100644
--- a/drivers/acpi/evged.c
+++ b/drivers/acpi/evged.c
@@ -180,7 +180,7 @@ static void ged_remove(struct platform_device *pdev)
 
 static const struct acpi_device_id ged_acpi_ids[] = {
 	{"ACPI0013"},
-	{},
+	{ }
 };
 
 static struct platform_driver ged_driver = {
diff --git a/drivers/acpi/fan_core.c b/drivers/acpi/fan_core.c
index 4324ff5d9c4c..0f128e41d3ad 100644
--- a/drivers/acpi/fan_core.c
+++ b/drivers/acpi/fan_core.c
@@ -46,7 +46,7 @@ MODULE_PARM_DESC(min_trip_distance, "Minimum distance between fan speed trip poi
 
 static const struct acpi_device_id fan_device_ids[] = {
 	ACPI_FAN_DEVICE_IDS,
-	{"", 0},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, fan_device_ids);
 
diff --git a/drivers/acpi/hed.c b/drivers/acpi/hed.c
index 48562f53d3ab..e5de7980c866 100644
--- a/drivers/acpi/hed.c
+++ b/drivers/acpi/hed.c
@@ -18,7 +18,7 @@
 
 static const struct acpi_device_id acpi_hed_ids[] = {
 	{"PNP0C33", 0},
-	{"", 0},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, acpi_hed_ids);
 
diff --git a/drivers/acpi/nfit/core.c b/drivers/acpi/nfit/core.c
index 591d2608374f..e62274b0ff38 100644
--- a/drivers/acpi/nfit/core.c
+++ b/drivers/acpi/nfit/core.c
@@ -3514,7 +3514,7 @@ EXPORT_SYMBOL_GPL(__acpi_nfit_notify);
 
 static const struct acpi_device_id acpi_nfit_ids[] = {
 	{ "ACPI0012", 0 },
-	{ "", 0 },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, acpi_nfit_ids);
 
diff --git a/drivers/acpi/pci_link.c b/drivers/acpi/pci_link.c
index 84bfcdf242dd..71ff2269e218 100644
--- a/drivers/acpi/pci_link.c
+++ b/drivers/acpi/pci_link.c
@@ -37,7 +37,7 @@ static void acpi_pci_link_remove(struct acpi_device *device);
 
 static const struct acpi_device_id link_device_ids[] = {
 	{"PNP0C0F", 0},
-	{"", 0},
+	{ }
 };
 
 static struct acpi_scan_handler pci_link_handler = {
diff --git a/drivers/acpi/pci_root.c b/drivers/acpi/pci_root.c
index 89c389a8b7a3..5ca57f6c9ea8 100644
--- a/drivers/acpi/pci_root.c
+++ b/drivers/acpi/pci_root.c
@@ -42,7 +42,7 @@ static int acpi_pci_root_scan_dependent(struct acpi_device *adev)
 
 static const struct acpi_device_id root_device_ids[] = {
 	{"PNP0A03", 0},
-	{"", 0},
+	{ }
 };
 
 static struct acpi_scan_handler pci_root_handler = {
diff --git a/drivers/acpi/pfr_telemetry.c b/drivers/acpi/pfr_telemetry.c
index 458cb99ae216..818359e21d1a 100644
--- a/drivers/acpi/pfr_telemetry.c
+++ b/drivers/acpi/pfr_telemetry.c
@@ -416,7 +416,7 @@ static int acpi_pfrt_log_probe(struct platform_device *pdev)
 
 static const struct acpi_device_id acpi_pfrt_log_ids[] = {
 	{"INTC1081"},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, acpi_pfrt_log_ids);
 
diff --git a/drivers/acpi/pfr_update.c b/drivers/acpi/pfr_update.c
index 459c2938b975..993ab5a479f5 100644
--- a/drivers/acpi/pfr_update.c
+++ b/drivers/acpi/pfr_update.c
@@ -595,7 +595,7 @@ static int acpi_pfru_probe(struct platform_device *pdev)
 
 static const struct acpi_device_id acpi_pfru_ids[] = {
 	{"INTC1080"},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, acpi_pfru_ids);
 
diff --git a/drivers/acpi/processor_driver.c b/drivers/acpi/processor_driver.c
index bdd1529d79f0..adde2a441373 100644
--- a/drivers/acpi/processor_driver.c
+++ b/drivers/acpi/processor_driver.c
@@ -38,7 +38,7 @@ static int acpi_processor_stop(struct device *dev);
 static const struct acpi_device_id processor_device_ids[] = {
 	{ACPI_PROCESSOR_OBJECT_HID, 0},
 	{ACPI_PROCESSOR_DEVICE_HID, 0},
-	{"", 0},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, processor_device_ids);
 
diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
index 861739b18e01..d528ae5606a6 100644
--- a/drivers/acpi/sbs.c
+++ b/drivers/acpi/sbs.c
@@ -46,7 +46,7 @@ MODULE_PARM_DESC(cache_time, "cache time in milliseconds");
 
 static const struct acpi_device_id sbs_device_ids[] = {
 	{"ACPI0002", 0},
-	{"", 0},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, sbs_device_ids);
 
diff --git a/drivers/acpi/sbshc.c b/drivers/acpi/sbshc.c
index c0ffa267f96c..bfc6098b5fed 100644
--- a/drivers/acpi/sbshc.c
+++ b/drivers/acpi/sbshc.c
@@ -35,7 +35,7 @@ static void acpi_smbus_hc_remove(struct platform_device *pdev);
 static const struct acpi_device_id sbs_device_ids[] = {
 	{"ACPI0001", 0},
 	{"ACPI0005", 0},
-	{"", 0},
+	{ }
 };
 
 MODULE_DEVICE_TABLE(acpi, sbs_device_ids);
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 9218264f8da1..7cd13e77497e 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1077,7 +1077,7 @@ static bool acpi_wakeup_gpe_init(struct acpi_device *device)
 	static const struct acpi_device_id button_device_ids[] = {
 		{"PNP0C0D", 0},	/* Lid */
 		{"PNP0C0E", 0},	/* Sleep button */
-		{"", 0},
+		{ }
 	};
 	struct acpi_device_wakeup *wakeup = &device->wakeup;
 	const struct acpi_device_id *match;
@@ -1801,7 +1801,7 @@ static bool acpi_is_indirect_io_slave(struct acpi_device *device)
 	struct acpi_device *parent = acpi_dev_parent(device);
 	static const struct acpi_device_id indirect_io_hosts[] = {
 		{"HISI0191", 0},
-		{}
+		{ }
 	};
 
 	return parent && !acpi_match_device_ids(parent, indirect_io_hosts);
@@ -1848,7 +1848,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 	 */
 		{"BCM4752", },
 		{"LNV4752", },
-		{}
+		{ }
 	};
 
 	if (acpi_is_indirect_io_slave(device))
@@ -2356,7 +2356,7 @@ static void acpi_default_enumeration(struct acpi_device *device)
 
 static const struct acpi_device_id generic_device_ids[] = {
 	{ACPI_DT_NAMESPACE_HID, },
-	{"", },
+	{ }
 };
 
 static int acpi_generic_device_attach(struct acpi_device *adev,
diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index 13e9a3a79d92..b6808eee1e69 100644
--- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -926,7 +926,7 @@ static const struct dev_pm_ops acpi_thermal_pm_ops = {
 
 static const struct acpi_device_id  thermal_device_ids[] = {
 	{ACPI_THERMAL_HID, 0},
-	{"", 0},
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, thermal_device_ids);
 
diff --git a/drivers/acpi/tiny-power-button.c b/drivers/acpi/tiny-power-button.c
index 92516ef84b02..4dcaf6a96f84 100644
--- a/drivers/acpi/tiny-power-button.c
+++ b/drivers/acpi/tiny-power-button.c
@@ -16,7 +16,7 @@ MODULE_PARM_DESC(power_signal, "Power button sends this signal to init");
 static const struct acpi_device_id tiny_power_button_device_ids[] = {
 	{ ACPI_BUTTON_HID_POWER, 0 },
 	{ ACPI_BUTTON_HID_POWERF, 0 },
-	{ "", 0 },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tiny_power_button_device_ids);
 
diff --git a/drivers/acpi/x86/s2idle.c b/drivers/acpi/x86/s2idle.c
index b79bf0fa9a7f..74e36c6365dc 100644
--- a/drivers/acpi/x86/s2idle.c
+++ b/drivers/acpi/x86/s2idle.c
@@ -123,7 +123,7 @@ MODULE_PARM_DESC(check_lps0_constraints, "Check LPS0 device constraints");
 
 static const struct acpi_device_id lps0_device_ids[] = {
 	{"PNP0D80", },
-	{"", },
+	{ }
 };
 
 /* Microsoft platform agnostic UUID */
@@ -524,7 +524,7 @@ static const struct acpi_device_id amd_hid_ids[] = {
 	{"AMD0005",	(kernel_ulong_t)&amd_picasso,	},
 	{"AMDI0005",	(kernel_ulong_t)&amd_picasso,	},
 	{"AMDI0006",	(kernel_ulong_t)&amd_cezanne,	},
-	{}
+	{ }
 };
 
 static int lps0_device_attach(struct acpi_device *adev,
diff --git a/drivers/acpi/x86/utils.c b/drivers/acpi/x86/utils.c
index 418951639f51..3444b96a2c20 100644
--- a/drivers/acpi/x86/utils.c
+++ b/drivers/acpi/x86/utils.c
@@ -47,7 +47,7 @@ struct override_status_id {
 };
 
 #define ENTRY(status, hid, uid, path, cpu_vfm, dmi...) {		\
-	{ { hid, }, {} },						\
+	{ { hid, }, { } },						\
 	{ X86_MATCH_VFM(cpu_vfm, NULL), {} },				\
 	{ { .matches = dmi }, {} },					\
 	uid,								\
@@ -470,7 +470,7 @@ static const struct acpi_device_id i2c_acpi_known_good_ids[] = {
 	{ "INT33FD", 0 },  /* Intel Crystal Cove PMIC */
 	{ "INT34D3", 0 },  /* Intel Whiskey Cove PMIC */
 	{ "NPCE69A", 0 },  /* Asus Transformer keyboard dock */
-	{}
+	{ }
 };
 
 bool acpi_quirk_skip_i2c_client_enumeration(struct acpi_device *adev)
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 9d3f039ebd94..aed3ddb388c0 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -831,7 +831,7 @@ int acpi_mrrm_max_mem_region(void);
 	{ "PNP0B00", },		\
 	{ "PNP0B01", },		\
 	{ "PNP0B02", },		\
-	{ "", }
+	{ }
 
 extern bool cmos_rtc_platform_device_present;
 
-- 
2.56.0.rc1


