Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5193606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gCS0LX/d;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=M6xj2LVW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=j+AhWvZjNA/Qk9G+7JEfWEukJQ9zCiGKSKZhtBAXKPQ=; b=gCS0LX/dHhuzTnLbi6AVQ7S1Th
	ejDl/dy1hHlE4By+z1Z6I3VvNPSQuzgky+ytvTvol7vb2PcCXwVozWB6DsKdxkR90lTH3CvvVL6vp
	ads3JDCq5jzQkGGgZgfokW0KtdGEEMAs2dc0EHOblomCcmuJxKzg17fd2GmAx8nUcR61dJMdsrRJe
	Mf4Krhdn4QYoChPUctyiSptgh0OBn99RDVL3m7Y3StqQQclFI3jQMhzcjxP9yksdaL/IHIcchprPH
	XjhOXIlfCuYFGpqdxY2QMAr/IofIivmnDztqAtTGUKCapJQU9iKjFs+z0O4nV7XTD89yqPxRWMds0
	S6fxfOaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWw2s-0000000GH1A-0vo2;
	Fri, 27 Nov 2026 13:31:22 +0000
Received: from smtp.ustc.edu.cn ([202.38.64.46] helo=ustc.edu.cn)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWw2l-0000000GGyL-3m0P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 13:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=j+AhWvZjNA
	/Qk9G+7JEfWEukJQ9zCiGKSKZhtBAXKPQ=; b=M6xj2LVWlIjUY6pgxfYIdCd+05
	VXuIMTGNTYuJESK7oU8x+51SiRaNjnXJUrrbbGQ3DYkxfqqKPpDqDd9eLY6mOhci
	LO365OnfaJYB0u7qqBDgt4Ay1+8EBt2Fx5E4qpVHMDciZNlTNvaHGKknbVRY4tcw
	1V1Spp3geeQ4QnZPM=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCXI0jphQlr2eQCAQ--.2853S2;
	Fri, 27 Nov 2026 21:30:18 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] coresight: add missing MODULE_DEVICE_TABLE() for CTCU and TPDA
Date: Fri, 27 Nov 2026 21:30:15 +0800
Message-ID: <20261127133017.1606830-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: 3pYKCgCXI0jphQlr2eQCAQ--.2853S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1Uuw17Jw15uFWkKF45ZFb_yoW8ZryxpF
	45K3y5CrZ8GF4F9a1xAF1jg3y8tr4kKw4YqFn8t3y7u3Z0vF95ZF12ka1rG3ZxGr1UG34r
	C390qr1vqFyDAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU838n5UUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAdso
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_053116_506339_D03A5036 
X-CRM114-Status: GOOD (  11.31  )
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

Hi,

both the CTCU and the TPDA driver are matched through an ID table, but
neither exports that table, so building them as modules produces a
module without an "of:" / "amba:" modalias.  udev cannot autoload such a
module, and the device stays unbound until somebody loads it by hand.

This was found on an SM8750 based phone (mainline v7.3.1,
CONFIG_CORESIGHT_CTCU=m and CONFIG_CORESIGHT_TPDA=m):

  # lsmod | grep -c coresight_ctcu
  0
  # modinfo -F alias coresight-ctcu
  (empty)
  # modprobe coresight-ctcu && readlink -f /sys/bus/platform/devices/10001000.ctcu/driver
  .../drivers/coresight-ctcu

Five tpda devices behave the same way.  With this series applied the
modules carry "of:N*T*Cqcom,sa8775p-ctcu" and "amba:d???F0F??" aliases,
and on the next boot both autoload with no modules-load.d help at all:

  # lsmod | grep -E 'coresight_(ctcu|tpda)'
  coresight_ctcu         16384  0
  coresight_tpda         24576  0
  # for f in /sys/bus/amba/devices/*; do [ -e $f/driver ] || n=$((n+1)); done; echo $n
  0

There is no functional change for built-in builds; MODULE_DEVICE_TABLE()
is only used for module aliases.

*** AI-assistance disclosure ***
This series was prepared with the help of an LLM coding assistant.  The
author reviewed every line, reproduced the before/after behaviour on
hardware and is responsible for the content.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
v2:
 - add the Fixes: tags requested by James Clark (both commits).
 - carry James Clark's Reviewed-by from v1.
 - no code change; the two hunks are byte-identical to v1.

v1: https://lore.kernel.org/all/20261127113137.931578-1-xiaqinghuan@mail.ustc.edu.cn/

Qianhui Xu (2):
  coresight: ctcu: add missing MODULE_DEVICE_TABLE()
  coresight: tpda: add missing MODULE_DEVICE_TABLE()

 drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +
 drivers/hwtracing/coresight/coresight-tpda.c      | 1 +
 2 files changed, 2 insertions(+)

-- 
2.51.0


