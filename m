Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D77E607315A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yZGa7APV;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H0PeochY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bNWLKDAO741BW0/XzcsTHBHCUfXie0HtjfUo7inFESE=; b=yZGa7APV1ZE1DvPYZGyfgC7nJV
	Vg9ZJSYxVOvNpFDxT8wP8hjXNAK4CtVskf0zmm7btCT9WpZKZdiiqO1rjhnmqIOCmAWGs4N4f2aig
	hUiOq5EhftUjp999lHRumTuhlnSQla6jSyjXNqGcM5NWSCaZE6ESSu4PCo5ROQyEIewxt2eHNB4yw
	EdSyDl8P0JYYKifyp8tXqkHje++BpB47uT2k7DWCsPKMD2ALAWI4cujjXpBeCr1DUIxvKO9kdP+zt
	dr2hZtBCujy8C9FiOQ5RpRc6Q7t+xp7z0o9WbVNT426zvbGzuhb5mE3mBFQuksfHX6kHgSRRbVUKi
	Wu+85KVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FN-0000000D44i-3lGW;
	Thu, 19 Nov 2026 18:52:37 +0000
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7FD-0000000D3ry-0V5f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:52:28 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-5735cd94235so171400b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114346; x=1795719146; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNWLKDAO741BW0/XzcsTHBHCUfXie0HtjfUo7inFESE=;
        b=H0PeochYuUsm4Z/83L4Zk800GWYsJF2k1JxrZohoBXdFOUxWkHzpn2tHx3Xn8RXNZ8
         eRS78FjPb/35TUcr9/COBp8q9P1F5B51fpu/JGfYK6TOJA2uMTVMCi5N8U49iHKa3wFq
         fJ84ID3K3Hc8IFU6aSz+ZVcuLS3/h2AR0LAbAztDPYXM2GFMe35aLkrKyY2gt7jRONxN
         oZ14TnbcVAt+KHia9fFEzVMlhuvEObQ/7emmyST06N8VH/8UGKWGaupLwkXtLfwEYn4/
         1Li7BjwvRvdZIJP8Xv7nw4WT0FKsGSAgKqhgNI250ByJamFAIv5jbDfVUFLkXqmma0Vi
         2kUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114346; x=1795719146;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNWLKDAO741BW0/XzcsTHBHCUfXie0HtjfUo7inFESE=;
        b=efz0qoI/6YI4jWPu8Z17dTXgNL7h52GaB6koqnsLxpnC1XG73U2lHwNHxfmv7TlxsJ
         SCq2SgH1AUxXneU2kTEDHWLQR5/lMoIAafLGGhMZpguDRlnbk11Kg1TzrDd74ykVNWyC
         Fsu3Fayy0Z1+xU6xoXvxzT2FydPNTyNZcOzIt4OfXJ7w7gcN1pnf8rzHFMrrTb/zFh8k
         xo0UVS/+987FMWj9g2WFBNYFRz/C9tegsWDSTnDf7Y2jOL4ckcy09ggMC7BwDS29+x/J
         P6omff2T+tNGa1yJC5jzHtFmCV6F7GtODG4V5jVPhezBjdeY5rLYDU7FzwdZ0OizIIZ+
         y85A==
X-Forwarded-Encrypted: i=1; AL+hErHB8YnuQmHwov+UlpErb8JBnDxTtBbrEHNEvKe+Z9V5sm1BQxgV2xclJWfX2ebzWUCF8GFGJtxvh8tF6adhdI2o@lists.infradead.org
X-Gm-Message-State: APuU4Z92i+6WucsFuuGxQlfZ8MZqivr4i6ZiyNpz4l6FX8cnW9/bfbm8
	ML18NyrDgkpKe8iD2M1MicIhHHf/EkLDOzJvxowFpxB7x95493Zv3uB5rrGSGTgBwKj58HYMS/f
	+Bg2lLhgTrCENP/r+taMYs7BC6A==
X-Received: from iogs7-n1.prod.google.com ([2002:a05:6602:c447:10b0:9c8:85bd:e3c2])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1983:b0:574:4c3f:992f with SMTP id 5614622812f47-57a0bb6079dmr866880b6e.42.1795114345394;
 Thu, 19 Nov 2026 10:52:25 -0800 (PST)
Date: Thu, 19 Nov 2026 18:51:52 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-11-coltonlewis@google.com>
Subject: [PATCH v10 10/33] perf: arm_pmuv3: Expose number of general-purpose
 counters in sysfs
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_105227_166612_CAF7018E 
X-CRM114-Status: GOOD (  11.84  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expose the number of general-purpose event counters implemented by each
ARMv8 PMUv3 instance at
/sys/bus/event_source/devices/<pmu>/caps/num_counters.

This allows userspace (such as VMMs configuring
KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS for a Partitioned PMU on
heterogeneous systems) to query the maximum number of general-purpose
counters for a specific PMU without reading PMCR_EL0.N directly from
EL0.

Suggested-by: James Clark <james.clark@linaro.org>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 667ce27d2347c..1676f13cc7c38 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -457,12 +457,26 @@ static ssize_t branches_show(struct device *dev,
 
 static DEVICE_ATTR_RO(branches);
 
+static ssize_t num_counters_show(struct device *dev,
+				 struct device_attribute *attr, char *page)
+{
+	struct pmu *pmu = dev_get_drvdata(dev);
+	struct arm_pmu *cpu_pmu = container_of(pmu, struct arm_pmu, pmu);
+	int nr_cntrs = bitmap_weight(cpu_pmu->cntr_mask,
+				     ARMV8_PMU_MAX_GENERAL_COUNTERS);
+
+	return sysfs_emit(page, "%d\n", nr_cntrs);
+}
+
+static DEVICE_ATTR_RO(num_counters);
+
 static struct attribute *armv8_pmuv3_caps_attrs[] = {
 	&dev_attr_branches.attr,
 	&dev_attr_slots.attr,
 	&dev_attr_bus_slots.attr,
 	&dev_attr_bus_width.attr,
 	&dev_attr_threshold_max.attr,
+	&dev_attr_num_counters.attr,
 	NULL,
 };
 
-- 
2.56.1.708.g77570a6a1d-goog


