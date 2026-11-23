Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6787F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 05:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kOYFKcWs;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kOWeMhnH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6MKMgBrhvjk9Xwbl3K4fGK3hHbMYaFtBoCoxF//MXr4=; b=kOYFKcWsr2vzkNzLR3yAnA4kR9
	g2iJ6fiwA9iyVpoqf4IiYhVjk9pA8HLs5ZRN+AaJNxvyGZSdXt2QD+91zgL9CjnAWtGhdZtOpA7iT
	EwUjDDbEoUBvSzb2BDXw9NuDUB8/B/niNoTXioNzSGkmWMQzZxxO1BmZBC7i6Em1QjR6+SUANi7y1
	iDW7fs/y05KjZ+DphM5w3oQMPfUtzxDstKXzO1tAGTi27OeP7VlGVZomMJ6YgNJPqLYAYEkQfol2N
	vR+ordNKj6yHNXCLZePN7hPFXB686/ZeVgZWFzWQyfjlTDBWWFjxLSkkvw6VFrz2ogd6B9j6yF3SV
	gynwHEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMUf-00000002ISU-1zv4;
	Mon, 23 Nov 2026 05:21:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVMUX-00000002IRG-4AUl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 05:21:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3001A618A1;
	Mon, 23 Nov 2026 05:21:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795411284;
	b=0SV5DPPiG4Y0iImDHrPmcSBW1arzjfpEWVRKjOvRZubHQOeCGSaL44FgZPlfm/0Xcv1T
	 nCRX8q2xHycweki7vGfCVtJGq/1XjVuiEMNVyr5X7LIRy/rG1Kp8eToPeOW9eZxynH1bM
	 MvIFhHnvEuTaygEa5hqfkS9cZ918aqac1j6LxOVycF//BDXRxFDMuAGaXERhxOhevjEAA
	 zqU4FdlbhcMQvnfjzCcfVqDs46S6CU1HMtTjOUODsU78NsZtSP/smJceH5NcLQVtVO9+m
	 VvIx3wXhV18JQX+UXVtMe1z1qZvHp2Kr4JdwNXyNIgHSjbpC712Q908bhtF+0m/wrHw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795411284;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6MKMgBrhvjk9Xwbl3K4fGK3hHbMYaFtBoCoxF//MXr4=;
	b=oxhfZ4KmMUtMkK8dN9imV0Khd+urajOh7jSc3k25zHiQhAPwiCBIVkiOneY/8QwFiJOt
	 FIYUiafWIwujwnX2cLNzdXZ9ZN1bB3d4bcznKk2p3b39DPjjCTH8hiZyHAQZW203AZp49
	 NnXA9n+zt9LWKuyBNf0oFfzoaw1LoVwRmOdIu/NtCzBj7Qdr20CORCHjGRhJITyMzHQeT
	 nS6tHrse1Oo/n4n3nvp09Z+zKeRkoSA7d4vtKsH8tAR2G3075y2cQRtsL4oWzcgO1UN1M
	 Jd0N1S4lparJ8SzToqzQx2e9/9PNdKzLMdq9u9l1vYFirjRQXxxAQHSEJ1vgmwL+Pfw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECA341F000CA;
	Mon, 23 Nov 2026 05:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795411284;
	bh=6MKMgBrhvjk9Xwbl3K4fGK3hHbMYaFtBoCoxF//MXr4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=kOWeMhnHWfvQ9j2F8N9QA7sbqvqo5UJ5qqUDyG6V2Vm+Uej8YmkxwcOhcfTkx1rSz
	 jGCJBPEXcHd1CuFJi33gKTouBEHhuDnWAzLUHsA48g1zgoJdhtKi38/FkbAwI7mlZH
	 MXzHn7LIKJZU5iR1V63PgV5dpQFLBvic8vJ2ZfkGp9W6Y7tA+uhK0QwDaPv2re7eN+
	 W9tq7VViwzuaM25fShR6wSkxgKwoo+hvKen7ZP3dXe0Zw+f2fLDRKZvXp9/08oKa/z
	 rbrwNsYi424gruJf2bD0a8pNurQrCwMEi8TRt0zsYRJvZL+0wkKck2nM2R5zPwT796
	 hGhtCSxCtcdLg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4F7134C35E;
	Mon, 23 Nov 2026 05:21:19 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] cpufreq: Fix leaks on probe error paths in three
 drivers
Date: Mon, 23 Nov 2026 05:21:17 +0000
Message-Id: <20261123-cpufreq-leaks-v2-0-29277f2f0ddd@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE3NA2sC/yXMTQqDMBBA4avIrA3EUSp4ldJFfiZ2tFjNmFIQ7
 27U5bd4bwOhyCTQFRtE+rHwd8rAsgD3NlNPin02oMZHVWGt3JxCpEV9yIyidBO0QV+31lvIzRw
 p8P/6PV+3JdmB3HpOYN8PSKQpOnEAAAA=
X-Change-ID: 20261123-cpufreq-leaks-04f0a2d37bdb
To: rafael@kernel.org, peter.griffin@linaro.org, viresh.kumar@linaro.org, 
 krzk@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, alim.akhtar@samsung.com, 
 linux-pm@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795411278; l=1170;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=QDauegO8UPnaZeDUw3mfjrBEpQxLHmQyKSmsmNN2bfA=;
 b=ayTGpoX9eQGy3FWHBI19LxiV6yguDuVCy4e+367rDqPox/Zu/ZVmMZIe+SWSYsSL1Vo7ZYiPC
 rR+YhWt8xFDBKed1TcCneLr4uVNNkNRPFUXgu7CCojH6+Bc/dNDs1L1
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: shyckless@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Three small fixes for resources that are not released when a cpufreq
driver fails to probe: the cpu clock in highbank, the three clocks in
kirkwood (also on unbind), and the regulators and register mappings in
s5pv210, and its reboot notifier, when cpufreq_register_driver() fails.

Found with a static analysis tool and checked by hand. Compile tested
on arm (W=1, multi_v5 for kirkwood); I don't have the hardware.

Changes in v2:
- 3/3: fix the Fixes tags. The regulator and reboot notifier leaks come
  from e8b4c1986efb and fe7f1bcbff91, and e0e5b2b4f427 did not add a
  leak (Zhongqiu Han). No code change.
- 1/3, 2/3: unchanged.

v1: https://lore.kernel.org/all/20261122-cpufreq-leaks-v1-0-96fc17ff7339@gmail.com/
---
Suyuan Wang (3):
      cpufreq: highbank: Put cpu clock if clk notifier registration fails
      cpufreq: kirkwood: Put clocks on error and in remove
      cpufreq: s5pv210: Fix resource leaks on probe error paths

 drivers/cpufreq/highbank-cpufreq.c |  1 +
 drivers/cpufreq/kirkwood-cpufreq.c | 15 ++++++++++++---
 drivers/cpufreq/s5pv210-cpufreq.c  | 12 +++++++++---
 3 files changed, 22 insertions(+), 6 deletions(-)



