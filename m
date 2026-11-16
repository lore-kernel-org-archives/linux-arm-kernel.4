Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0242606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 17:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OKnTf2TP;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=B5xAGCPn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Hx4wP6Qpw+W2JkzO57bSdEnCFN3xLXbhd0iZcTNwJZ4=; b=OKnTf2TPlCEmBg9Y+eB6KjEpZr
	VaXh/BQqbO3NqCkXVqF2i0l0bWdYhWfSNFmXohdKZQzt5kWfGskidQcO8dcstnyy3jDi86g7YzDBo
	cd4D8sT6wfNyUzWlAy1lOnEkUShtLBmVHmixHxK1KSYEYMcNtgfji8peRKE/kjU/KEO7tBKkVQabi
	R/9pvVL1TzXBZk/W5C+75XSpQ9uC+dy3jjuGZNX6UMUJaXFmvCJlKH7Zpg/+GKsTy7Lu71DUfGVQx
	xvq+j/dHUf13rLuAi/Dbnyfg/FsDQaB9WGKfAFBqhKQo3tr4uaRKd1+7zZ2jSAwvnnVSEeZhgHAv/
	hIZIiUxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0eq-00000003QTd-2ykV;
	Mon, 16 Nov 2026 17:38:20 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0en-00000003QSy-1Yir
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 17:38:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c50933bdf4bso14129566b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 09:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794850695; x=1795455495; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hx4wP6Qpw+W2JkzO57bSdEnCFN3xLXbhd0iZcTNwJZ4=;
        b=B5xAGCPntDVFXhiuxelRSQv+i1TLCBpIbcf+EzMsVllG9A/9mvO/aPSRwtSH/rwMDL
         qQjpmyfgnigvXBwaakhLvha6/qzfMFcIkC/1OWr6oN769H40KfDshB/crZAgkK56z8Of
         kswEIG1n+uJsaNtu73Amf6wFVBb+gYjTLzeso2qdlpIw88wR3BcJ5j3e0567OPSB4VMI
         26xFMHz7Tlm/1CSaLaUjq5UZpi7eLGV6saB8QoQMsg1eFh0UDx/auBIyQGMLhq2LRDKf
         d9grN+b3ht0GvSGIh3CMtg3pWKsPnabxzMtbUkcdTUOVggFF6GqnECCdNqXGKdMoTvmG
         MVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850695; x=1795455495;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Hx4wP6Qpw+W2JkzO57bSdEnCFN3xLXbhd0iZcTNwJZ4=;
        b=1TpVQvoq9AptQYw5lf82UWuCCSAO2fopU3QM6tOC3bLZhbAP/NE0/9arzTJm1csFhh
         UMN/ws5ks2xOgzwkDBbGHyDNucP4TuA1reUZ60vHGFXibfsXdky40jGOHMRwCHdtX78d
         38y7ssLNuyYpLVJ7acIRq5x0Dt7vfHovNtoUCm3Nsg/fal0HdiU4laHEfJjrbzuLwJwr
         JH9DzhXVlUO8aD/EBZD7h5D4skWePoKIO2vCuvs6tIMnfJIV18+kicupS05WONJ7y6Sl
         5g/SJmw+HlDiM87rGdFKLv2g+Qg91Hh29h/mxwr/8Xl5POa984HREaNotWs4rF7C8w5M
         j1xQ==
X-Forwarded-Encrypted: i=1; AL+hErGuin/ZzFlNxO4j0mzAGGoA7kdDonr4iobxIj2dZOPY3NlgCx9otbKrt0VNPx8jxM+rQw5HZbD6h41fBb8cqTOm@lists.infradead.org
X-Gm-Message-State: APuU4Z8E8lUG5vlOFvIuLEgnde16SGqqrozKPSFDhXLuK5jkPMr4AkYl
	7IsxFdM6L2FbVI4Eo6LMr4zM6g4b/vANsbJh9CrhQhFDq3IWhGgzzr62jm9jyhLKJ+M=
X-Gm-Gg: AYBFou0rNL3u/GMU6mQkH7uODqpnrzqGOJI5rblEPt5DVYjFwfp+BRxp9a+L8ac9ifw
	/IOTejJBXMGbPZjBt3f/kIz3eV1WKrsqrxWgXZNXXXYZXKyzay3B+c61u0vPpQrn0kRVhDvJspO
	d35yXdsId6FjaNai5sdnqdCpDYMgo3uxOvPB/N/1mRA1ENksvksVMy1FuNTde+Oq+P1tMSTEfJr
	TL82VC2Cfe1T1szdnGfpxuT0sfR2YWE5Hpus8amztL0BTVxEteTqCxHajqkzUWtNDcIaUCrrRah
	uDEY56lNITvGQf/84dptrAZC9ebpqrnThnKmYK5qtiKNZhrw5h9pGFc0Kdwafvg/niE/W+32eAR
	fXQ06uq4e4UZM2Fve0j65lQwa43JKOIKBwSVArnpgZ2jfGEBCMLAudosQFqxceX/nKGyKCp2Y48
	eu3j0URvTXsTGxrjD8/JfaNP0RWTbmsW2EZ3tvY0zLhrKmfh5h/5slzxze+RprgUf6GU1WDayr7
	S6CRuUc04LvCwUNFkfbBIrRxvcGRs+WsMD4xMDtqhRrEwkHhdtITgyB9sLAz484u2Y/+cxXqEYI
	mX3qMuock1GYEQvE02xm5jx4JKTKFcArhJO0Xep7cVQzdM6WYqjpcy9Df5m74/165T3w+ZiWG2v
	Q3YxCmVtWtTku28z4/tY/
X-Received: by 2002:a17:907:c05:b0:c4d:31ca:e316 with SMTP id a640c23a62f3a-c50f3750c5amr12270066b.20.1794850694766;
        Mon, 16 Nov 2026 09:38:14 -0800 (PST)
Received: from petegriffin.c.googlers.com (131.44.147.34.bc.googleusercontent.com. [34.147.44.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b236d4sm446139766b.18.2026.11.16.09.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:38:14 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 16 Nov 2026 17:37:45 +0000
Subject: [PATCH] iommu: Add iommu.passthrough_devs early command line
 parameter
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGk/+2oC/x3MTQ5AMBBA4avIrE3S+qlwFbGoGjoLKh1EIu6us
 fwW7z0gFJkEuuyBSBcLhy1B5xk4b7eFkKdkKFRhtFYGxwo5rOuJuxU5fAzn4nGiS1CVY+PaurH
 OtJD6PdLM9//uh/f9ADzTmQFrAAAA
X-Change-ID: 20261106-b4-iommu-passthrough-devs-03b7c957ac69
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mostafa Saleh <smostafa@google.com>, 
 Daniel Mentz <danielmentz@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9600;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Urii5UKIxhJqrjIOWrcWNvsYviHjsPHlhkwtRzKuN1c=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBq+z+FdmbITb7QSpfMSMqFlTLiiBCd9JSTCLH+A
 y3xzXvXjFeJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCavs/hQAKCRDO6LjWAjRy
 ugkwD/9qAsQpXBexhOE0F92j/h8ThC5MjImpB5XuU5sP+iZkubQpQME68KqcxlWtriHDtYmMck/
 V/8gx+6ZM7BEan//0oKVbRk8WVE1ZS7tz6ux7YMNof5ppP4EcaOTbhQUPb0Ud0XBVn2KJRTayfB
 5IVJsjU4alquntf+SnaOvNtg5MoBWVaTzNVfpNLutOLMyW7cxFQrA+vBSpIysIxxi7zaK1Nvrbw
 zcXQGNqk2tCRFEQaCNOC7RZzl/OUiVhauPLbCc2jEuCiBWBWR1gw1rPBNmtoZisclaTVG3dCTV1
 PleJtd28phplPOzcxMuHNwC/kysdPiNSoNT7JJJZfqZfaCKhLUqXoFlPW/ZgfD7VdddINoUVBf8
 BMy9E9OMkKNk38iL1XnWZZUSfNCAHKzoPpGewxknhrFwlIjl73zyW4fohdh3to5k3gO3rACMzZO
 e7TFOBB1zId4C0TEuPm6pXfEswtf6T8UiZtp4XJlRkIA9o3FHeZB7zbgdAaRyZQIwt2s0KbTrDu
 LDZKfmIqp16Q5hcCsUwb6hrIQgHw95UAyfTyB3ZSDKUfyfm3Svdz+0LtA+HG2bkOy03W5tEfnlL
 s/5mTy0kfDmnW/5PKOCGtEGWVhkG5dsBx8vI0Wruaxx38gQqgees0Clr61s/bnWwg/4WqE38k6O
 gcsj4cMgajuTGqA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_093817_486253_F82C290D 
X-CRM114-Status: GOOD (  31.78  )
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

Currently, the generic IOMMU core only provides an all-or-nothing global
switch ('iommu.passthrough={0,1}' and CONFIG_IOMMU_DEFAULT_PASSTHROUGH)
to configure default DMA domains in passthrough (IOMMU_DOMAIN_IDENTITY)
mode at boot time.

Add an 'iommu.passthrough_devs=<dev_name>[,<dev_name>...]' early
command-line parameter. When allocating the default domain for a group in
iommu_group_alloc_default_domain(), if no mandatory domain type override
is present, check whether any device in the group (or any of its
parent/bridge devices via dev->parent) matches 'iommu.passthrough_devs'
and request IOMMU_DOMAIN_IDENTITY, warning and falling back to
IOMMU_DOMAIN_DMA if identity domains are unsupported (consistent with
'iommu.passthrough=1').

Device names match dev_name(), such as PCI BDFs ('0000:01:00.0'),
Device Tree platform devices ('3c400000.ufs'), or ACPI platform
devices ('AMDI0010:00'). Walking dev->parent also allows specifying a
parent PCIe host controller or root port (e.g. '3c500000.pcie' or
'0000:00:1c.0') to cover its downstream endpoints.

Note: Untrusted PCI devices ('pdev->untrusted') and explicit IOMMU
driver '.def_domain_type' requirements continue to take precedence.

Configuring per-device passthrough mode at boot is needed for several
use cases:

- Performance tuning and benchmarking: high-throughput storage
  workloads (e.g. fio benchmarks on UFS) can incur measurable
  IOPS/latency and CPU overhead from IOMMU page table management and
  TLB invalidations. Selective device passthrough allows bypassing
  translation for these devices while keeping IOMMU isolation enabled
  for other devices in the system.

- SoC/board bringup and debugging: isolating whether a DMA fault or
  regression is caused by a specific device's IOMMU translation without
  disabling the IOMMU globally across the entire platform.

Implementing this in the generic IOMMU core allows it to work with
ACPI and Device Tree (DT) systems as well as across all IOMMU drivers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Hi folks,

This patch follows up on a conversation with Jason Gunthorpe at
Linux Plumbers regarding how to upstream support for configuring
per-device IOMMU passthrough (IOMMU_DOMAIN_IDENTITY) at boot without
abusing Device Tree properties.

Downstream on Google Pixel G5 Laguna platforms, we have historically
carried a custom 'iommu-idmapped' DT property parsed by the arm-smmu-v3
driver to place specific client devices into bypass mode. As discussed
at Plumbers, Device Tree seems the wrong place for this because choosing
passthrough vs. translation for a given device can sometimes be an OS
policy trade-off where we choose device peak performance at the expense
of DMA isolation. This is the case for UFS and PCIe WLAN on Laguna,
which share a common SMMU instance with other peripherals (such as DMA
controllers, VPU, and ISP) where we want DMA isolation to remain
enabled.

A secondary benefit is it could be useful during device bringup and
debugging for fault isolation and to work around firmware/device issues
before a proper driver quirk is in place.

Instead, I propose handling this in the generic IOMMU core via a
kernel command-line parameter. This makes it available uniformly
across both Device Tree and ACPI systems and across all IOMMU drivers.

In terms of upstream Laguna support, initial DT support has already
landed in tree, along with USB and phy support. Other support for
mailbox, clocks, powerdomains, reset is under review in the following
series with more to follow.

https://lore.kernel.org/lkml/20261023235408.3063350-1-dianders@chromium.org/
https://lore.kernel.org/lkml/20261026214359.3122870-1-briannorris@chromium.org/

Feedback and suggestions are very welcome.

Thanks,

Peter
---
 Documentation/admin-guide/kernel-parameters.txt | 11 ++++
 drivers/iommu/iommu.c                           | 76 +++++++++++++++++++++++--
 2 files changed, 82 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c343bc9a0d28..926380cb1e99 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2689,6 +2689,17 @@ Kernel parameters
 			1 - Bypass the IOMMU for DMA.
 			unset - Use value of CONFIG_IOMMU_DEFAULT_PASSTHROUGH.
 
+	iommu.passthrough_devs=
+			[KNL,EARLY] Configure DMA to bypass the IOMMU by default
+			for specific devices.
+			Format: <dev_name>[,<dev_name>...]
+			Specify a comma-separated list of device names (matching
+			dev_name() of the client device or any of its parent/bridge
+			devices) whose IOMMU groups should default to passthrough
+			(identity) mode (e.g. "0000:01:00.0" for PCI,
+			"3c400000.ufs" for Device Tree, or
+			"AMDI0010:00" for ACPI).
+
 	iommu.debug_pagealloc=
 			[KNL,EARLY] When CONFIG_IOMMU_DEBUG_PAGEALLOC is set, this
 			parameter enables the feature at boot time. By default, it
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b486b8bbd1fc..0a7796e0311e 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -33,6 +33,7 @@
 #include <trace/events/iommu.h>
 #include <linux/sched/mm.h>
 #include <linux/msi.h>
+#include <linux/string.h>
 #include <uapi/linux/iommufd.h>
 #include <linux/generic_pt/iommu.h>
 
@@ -43,9 +44,12 @@ static struct kset *iommu_group_kset;
 static DEFINE_IDA(iommu_group_ida);
 static DEFINE_IDA(iommu_global_pasid_ida);
 
+#define IOMMU_PASSTHROUGH_DEVS_MAX_LEN	256
+
 static unsigned int iommu_def_domain_type __read_mostly;
 static bool iommu_dma_strict __read_mostly = IS_ENABLED(CONFIG_IOMMU_DEFAULT_DMA_STRICT);
 static u32 iommu_cmd_line __read_mostly;
+static char iommu_passthrough_devs[IOMMU_PASSTHROUGH_DEVS_MAX_LEN] __read_mostly;
 
 /* Tags used with xa_tag_pointer() in group->pasid_array */
 enum { IOMMU_PASID_ARRAY_DOMAIN = 0, IOMMU_PASID_ARRAY_HANDLE = 1 };
@@ -805,6 +809,27 @@ static int __init iommu_set_def_domain_type(char *str)
 }
 early_param("iommu.passthrough", iommu_set_def_domain_type);
 
+static int __init iommu_set_passthrough_devs(char *str)
+{
+	size_t len;
+
+	if (!str || !*str)
+		return -EINVAL;
+
+	len = strlen(iommu_passthrough_devs);
+	if (len + (len ? 1 : 0) + strlen(str) >= IOMMU_PASSTHROUGH_DEVS_MAX_LEN) {
+		pr_warn("Too long list of device names for 'iommu.passthrough_devs'!\n");
+		return -EINVAL;
+	}
+	if (len)
+		iommu_passthrough_devs[len++] = ',';
+
+	strscpy(iommu_passthrough_devs + len, str,
+		IOMMU_PASSTHROUGH_DEVS_MAX_LEN - len);
+	return 0;
+}
+early_param("iommu.passthrough_devs", iommu_set_passthrough_devs);
+
 static int __init iommu_dma_setup(char *str)
 {
 	int ret = kstrtobool(str, &iommu_dma_strict);
@@ -1750,14 +1775,45 @@ __iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 	return ERR_PTR(-EINVAL);
 }
 
+static bool iommu_is_passthrough_dev(struct device *dev)
+{
+	for (; dev; dev = dev->parent) {
+		const char *name = dev_name(dev);
+
+		if (name && *name &&
+		    parse_option_str(iommu_passthrough_devs, name))
+			return true;
+	}
+
+	return false;
+}
+
+static struct device *iommu_group_passthrough_dev(struct iommu_group *group)
+{
+	struct group_device *gdev;
+
+	if (!iommu_passthrough_devs[0])
+		return NULL;
+
+	for_each_group_device(group, gdev) {
+		if (iommu_is_passthrough_dev(gdev->dev))
+			return gdev->dev;
+	}
+
+	return NULL;
+}
+
 /*
  * req_type of 0 means "auto" which means to select a domain based on
- * iommu_def_domain_type or what the driver actually supports.
+ * iommu.passthrough_devs, iommu_def_domain_type, or what the driver
+ * actually supports.
  */
 static struct iommu_domain *
 iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
 	const struct iommu_ops *ops = dev_iommu_ops(iommu_group_first_dev(group));
+	unsigned int def_type = iommu_def_domain_type;
+	struct device *pt_dev = NULL;
 	struct iommu_domain *dom;
 
 	lockdep_assert_held(&group->mutex);
@@ -1777,19 +1833,29 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 		return __iommu_group_alloc_default_domain(group, req_type);
 
 	/* The driver gave no guidance on what type to use, try the default */
-	dom = __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
-	if (!IS_ERR(dom))
+	if (def_type != IOMMU_DOMAIN_IDENTITY) {
+		pt_dev = iommu_group_passthrough_dev(group);
+		if (pt_dev)
+			def_type = IOMMU_DOMAIN_IDENTITY;
+	}
+
+	dom = __iommu_group_alloc_default_domain(group, def_type);
+	if (!IS_ERR(dom)) {
+		if (pt_dev && dom != group->default_domain)
+			dev_info(pt_dev,
+				 "Setting default IOMMU domain to passthrough via command line\n");
 		return dom;
+	}
 
 	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
-	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
+	if (def_type == IOMMU_DOMAIN_DMA)
 		return ERR_PTR(-EINVAL);
 	dom = __iommu_group_alloc_default_domain(group, IOMMU_DOMAIN_DMA);
 	if (IS_ERR(dom))
 		return dom;
 
 	pr_warn("Failed to allocate default IOMMU domain of type %u for group %s - Falling back to IOMMU_DOMAIN_DMA",
-		iommu_def_domain_type, group->name);
+		def_type, group->name);
 	return dom;
 }
 

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-b4-iommu-passthrough-devs-03b7c957ac69

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


