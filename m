Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC2B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m2OQbxpF;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=KqYjVDkN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=s9yp4SBxO/oHO8LIQtXVK8tFMz7ppzjwdoJtbh3yIDI=; b=m2OQbxpFwwHiMv2Ch/37A15Bl0
	jj5Yqe5rfTrovAZsoxS5wbJD375+f2DZNJgpQYbu7cw/0c+aefhOAZt3P/tgYLz6QVBJ5YaX4cpIw
	gtCoSVXpY8fhP5CjOcFw8uEIVbtQ69WU5HgTxv+SIpu7JqOQggl3dtUw36WNJE/TUWUHNlJwhHFf/
	NuWW1YvwooJr1VlMkSCxreCISQ5qbtip99Lu1LDUjdUnm/G5gqL7d6k9c2qfZLVgW79Sn4XuFfDr6
	hRyWIlrSZn0OPTBn5QpOZ7wjCMj0x1ptKzl4Q7lmyqRDjDkNdhHMhvVxquTQ2ztnm4/dno/asQ0RY
	A5XmcZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuBf-0000000FomI-0ev9;
	Fri, 27 Nov 2026 11:32:19 +0000
Received: from smtp.ustc.edu.cn ([202.38.64.46] helo=ustc.edu.cn)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuBR-0000000Fohb-14SG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:32:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=s9yp4SBxO/
	oHO8LIQtXVK8tFMz7ppzjwdoJtbh3yIDI=; b=KqYjVDkN4u/lA5PmgbjVWBJZRL
	MBZA+NugTE24LHVqbvSSspMInLleVwlNkzCfKsoC/nHvaHEj3DOiSHWBaymzq3oT
	e2wmZPXyHV//yZEBcewcrGfSadgKbSSy2UnSEXD7nR3g+Jr/mzl9YhxMBn2l86kS
	tJlaqVAe7z3A+jjgg=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAntEgZaglrkHICAQ--.2585S2;
	Fri, 27 Nov 2026 19:31:37 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: suzuki.poulose@arm.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] coresight: add missing MODULE_DEVICE_TABLE() for CTCU and TPDA
Date: Fri, 27 Nov 2026 19:31:35 +0800
Message-ID: <20261127113137.931578-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: 3pYKCgAntEgZaglrkHICAQ--.2585S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw1Uuw17Jw15uFWkKF45ZFb_yoW8Ar1UpF
	W5K3y5Crs8GFsYvan7AF1qq3yFyw4kKr4YqFn5J3y7u3Z0vr95ZF1jka1rG3ZrGr15K34S
	kan0qryvqFyDAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jYlksUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAMs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033206_570349_13CD52E3 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Qianhui Xu (2):
  coresight: ctcu: add missing MODULE_DEVICE_TABLE()
  coresight: tpda: add missing MODULE_DEVICE_TABLE()

 drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +
 drivers/hwtracing/coresight/coresight-tpda.c      | 1 +
 2 files changed, 2 insertions(+)

-- 
2.51.0


