Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A1D60A262D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LQQhFMV/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5uCHaY+d+EreOr4KjJ27to6WGWTyNXNqphjNuVoJ+lo=; b=LQQhFMV/pNCysYQixh0Mqb8mC+
	yu3xHkXtUZldv1asRWK+Wsbo6sOFDEIM6l420GG0auupKA0bU6SeEEfL3FVL7JwKVKCvUuWnVJ0Au
	bfOCQcr3m2z5DW3EF3eFYVg/E4uR0HBjIsEVsu8D3GAYZ+p3OgDk870COT4l/RYnHv+c40qtVXAf9
	hhGEx5PlBQ8uk/0YSZw5s3Yj4hUQnmFCpD0SUykgmB6t3FQaH5HrxO/P1fB9hepG3efjiBRDFkb3F
	XiVAuf0o+LDZ4McZAa5SL7Z5NVGOzdoy2uh7bShDG2lBJTKiYYEMSAOUE4qqEIqWgQz4vC5HoAqvH
	rIGS38CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpEg-0000000CV9O-1FEc;
	Fri, 13 Nov 2026 11:14:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpEf-0000000CV92-1cqN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:14:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id CEDB462398;
	Fri, 13 Nov 2026 11:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D16931F000C4;
	Fri, 13 Nov 2026 11:14:23 +0000 (UTC)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Len Brown <lenb@kernel.org>,
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
	linux-pci@vger.kernel.org,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Chu Guangqing <chuguangqing@inspur.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mika Westerberg <westeri@kernel.org>
Subject: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id arrays
Date: Fri, 13 Nov 2026 12:13:56 +0100
Message-ID: <cover.1794567577.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4135; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=6g9eJPIna9nXlYz5oY9GDvVOE+uQvQq1cCDAUQqIBMY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq9vD1Kg2jK4rH2lmPt2M0Te8a2xic+vqtitA1M MvIAFTTaT6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavbw9QAKCRCPgPtYfRL+ TjduB/9LBwdKRfEgL0Z71JbSxfnKjG4cK1gLHWsDCCiAyYAXixAp/0bThuLUukIoPUgCEpNSKK1 wcy1HvRlRjngb8u209KeEXLpyb3g3IoKuJNwjdfa1tzl1fSRnEI5qlEZHE4p5PAtjiN1hYGFH/u IFTavpxOlQDmTwnXqJogxdEXwDZO4BvsgXIh8100Q+/9Mv2gq1PPmor0KU6Y78OyoznaHmvr++0 6PyWE0lXRx2PO9ePuKFx/79xvcpzWQ2lltsYtpZ4ksnFGHTIeN0RJotAmYPoHA/CwK5xkPOh3Kl yempOaPt5ZHdPuiA6EY3eM2i+VNfN+79E9tIE6qyV3ikyaoX
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Uwe Kleine-König <ukleinek@kernel.org>

Hello,

this series is about preparing drivers/acpi for a change to struct
acpi_device_id. The idea is to replace .driver_data by an anonymous
union, see
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for more details. (The linked example is about platform_device_id, I
intend to apply it acpi_device_id and several others, too.)

Before this union can be added, all initializers must use named
initializers (C99 calls them designated initializers), which IMHO is a
nice cleanup that can stand for itself as it makes the code easier to
read.

Pawel sent a similar series earlier, find it at
https://lore.kernel.org/all/20260727-acpi-refactor-v1-0-ff900aa326ee@thegoodpenguin.co.uk/.
Compared to that the patch splitting is done differently and the base
here is newer.

I checked for the other *_device_id and for these there is nothing to do
below drivers/acpi because the few instances already use named
initializers.

The last patch in this series is just some cosmetic to align the coding
style. If you consider it churn, just drop it.

It would be great to get this series in soon, as keeping it up to date
for a later resend is an annoying effort. Thanks for your cooperation.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (4):
  ACPI: Unify acpi_device_id list terminators
  ACPI: Drop unused .driver_data initializers in acpi_device_id arrays
  ACPI: Use named initializers for acpi_device_id arrays
  ACPI: Unify *_device_id list terminators

 drivers/acpi/ac.c                       |   6 +-
 drivers/acpi/acpi_apd.c                 |  46 +--
 drivers/acpi/acpi_memhotplug.c          |   4 +-
 drivers/acpi/acpi_pad.c                 |   4 +-
 drivers/acpi/acpi_platform.c            |  12 +-
 drivers/acpi/acpi_pnp.c                 | 514 ++++++++++++------------
 drivers/acpi/acpi_processor.c           |   6 +-
 drivers/acpi/acpi_tad.c                 |   4 +-
 drivers/acpi/acpi_video.c               |   4 +-
 drivers/acpi/apei/ghes-nvidia.c         |   2 +-
 drivers/acpi/arm64/amba.c               |   6 +-
 drivers/acpi/battery.c                  |   8 +-
 drivers/acpi/bus.c                      |   2 +-
 drivers/acpi/button.c                   |  14 +-
 drivers/acpi/container.c                |   8 +-
 drivers/acpi/dptf/dptf_pch_fivr.c       |  14 +-
 drivers/acpi/dptf/dptf_power.c          |  38 +-
 drivers/acpi/ec.c                       |   8 +-
 drivers/acpi/evged.c                    |   4 +-
 drivers/acpi/fan_core.c                 |   2 +-
 drivers/acpi/hed.c                      |   4 +-
 drivers/acpi/mipi-disco-img.c           |   2 +-
 drivers/acpi/nfit/core.c                |   4 +-
 drivers/acpi/osi.c                      |   2 +-
 drivers/acpi/pci_link.c                 |   4 +-
 drivers/acpi/pci_root.c                 |   4 +-
 drivers/acpi/pci_slot.c                 |   2 +-
 drivers/acpi/pfr_telemetry.c            |   4 +-
 drivers/acpi/pfr_update.c               |   4 +-
 drivers/acpi/pmic/intel_pmic_bxtwc.c    |   2 +-
 drivers/acpi/pmic/intel_pmic_chtdc_ti.c |   2 +-
 drivers/acpi/pmic/intel_pmic_chtwc.c    |   2 +-
 drivers/acpi/power.c                    |   2 +-
 drivers/acpi/processor_driver.c         |   6 +-
 drivers/acpi/processor_idle.c           |   2 +-
 drivers/acpi/sbs.c                      |   4 +-
 drivers/acpi/sbshc.c                    |   6 +-
 drivers/acpi/scan.c                     |  48 +--
 drivers/acpi/sleep.c                    |   2 +-
 drivers/acpi/thermal.c                  |   6 +-
 drivers/acpi/tiny-power-button.c        |   6 +-
 drivers/acpi/video_detect.c             |   2 +-
 drivers/acpi/x86/blacklist.c            |   2 +-
 drivers/acpi/x86/cmos_rtc.c             |   2 +-
 drivers/acpi/x86/lpss.c                 |  58 +--
 drivers/acpi/x86/s2idle.c               |  14 +-
 drivers/acpi/x86/utils.c                |  22 +-
 include/linux/acpi.h                    |   8 +-
 48 files changed, 466 insertions(+), 466 deletions(-)


base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
-- 
2.56.0.rc1


