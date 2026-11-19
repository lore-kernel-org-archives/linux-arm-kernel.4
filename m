Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F352360A2614
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3gOUbc06;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=daCgpKin
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CYTdg/ZbWYFGIrC86gz99BU0CGcr9ksMpr62NJg3iH8=; b=3gOUbc06cf5sR/
	NB+tcJH5+G028NNTUiFb4tMpFcceQKgDZaMntLIhG4YTZzcmPyvFN/ecnNSJ7NbP+3ijArEDNmIZo
	7pj2Ow2oVFfFgb9kw9xSPABv7NVwfYabYTLFkUV+78V5wCxLsHK9JvkK5l99JCzxHBghl+VyTo47a
	0OD/31xcGPI/LfhYS8eMW7EunUdSVLnJvu6Bnbgka6dLHiwxmqt46+eYWzKHXexbCxXtjBXgH6Otq
	GY1EkhSy4F0Gm3VBB3NNUnFn/Le8C9ji4E+AAm7IG443zg8Qi/HZdXDc5+hwb87nWH8mpKr3zOwAP
	PXpGklAYvzk5MeLMKLJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Bx-0000000CUYb-0m0Q;
	Thu, 19 Nov 2026 15:36:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4Bm-0000000CUSz-2WV0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:36:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F4F11C00;
	Thu, 19 Nov 2026 07:36:38 -0800 (PST)
Received: from e142430.arm.com (e142430.arm.com [10.33.10.110])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 914713F882;
	Thu, 19 Nov 2026 07:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795102601; bh=ibynNGRiusd6ZgkuSuWkJ+rzZqrUZwhkZUAn9KEZDKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=daCgpKinQtU2ezBSqGagx3sjYxrrHHV0pqROpBagBe1GP7ENzKjypG+DIFYumtxbJ
	 uO0ZaRu2cekIvBa2KeAhYC3zC3Lv5U9J1jGmLisVRcGx1f8L3AudaAxRBeWH/0FEvR
	 ZH3YF39yJGn8WISAY/T5MwJ9K3FIMabrmCebqzsc=
From: Ahmed Azeem <ahmed.azeem@arm.com>
Date: Thu, 19 Nov 2026 15:36:05 +0000
Subject: [PATCH RFC 3/4] firmware: arm: Add PFDI run, result, and error
 injection support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-3-4772d18b9115@arm.com>
References: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
In-Reply-To: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
To: linux-arm-kernel@lists.infradead.org, 
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-api@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Divin Raj <divin.raj@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
 Ahmed Azeem <ahmed.azeem@arm.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_073646_705537_5575BCE2 
X-CRM114-Status: GOOD (  19.62  )
X-Spam-Score: -4.4 (----)
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

From: Divin Raj <divin.raj@arm.com>

Extend the PFDI driver with ioctls to execute tests and manage results.

Add support for PFDI_IOCTL_PE_TEST_RUN, PFDI_IOCTL_PE_TEST_RESULT, and
PFDI_IOCTL_FORCE_ERROR, along with per-CPU state to serialize test
execution. When firmware reports PFDI_RET_FAULT_FOUND, return the
failing test identifier to userspace.

Signed-off-by: Divin Raj <divin.raj@arm.com>
Signed-off-by: Ahmed Azeem <ahmed.azeem@arm.com>
---
 drivers/firmware/arm_pfdi.c | 225 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 225 insertions(+)

diff --git a/drivers/firmware/arm_pfdi.c b/drivers/firmware/arm_pfdi.c
index 8c6d315b0572..22a69b12dbc8 100644
--- a/drivers/firmware/arm_pfdi.c
+++ b/drivers/firmware/arm_pfdi.c
@@ -18,10 +18,16 @@
 #include <linux/slab.h>
 #include <linux/smp.h>
 #include <linux/uaccess.h>
+#include <linux/wait.h>
 
 struct pfdi_per_cpu_info {
+	atomic_t run_inprogress;
 	/* Ensures a single userspace owner per CPU while the node is open. */
 	struct semaphore open_sem;
+	/* Serializes per-CPU run state and device availability. */
+	struct mutex state_lock;
+	struct pfdi_test_range ongoing_run_range;
+	wait_queue_head_t run_wait;
 };
 
 struct pfdi_dev_data {
@@ -36,6 +42,8 @@ struct pfdi_cpu_worker {
 	u32 feature_fid;
 	/* Protects worker lifetime and in-flight work state. */
 	struct mutex worker_lock;
+	struct pfdi_force_error error_info;
+	struct pfdi_test_run test_run;
 	struct arm_smccc_res smc_ret;
 	int result;
 };
@@ -59,6 +67,10 @@ static DEFINE_PER_CPU(struct pfdi_per_cpu_info, pfdi_cpu_info);
 
 static enum cpuhp_state pfdi_cpuhp_state;
 
+static unsigned int pfdi_wait_timeout_ms = 60;
+module_param_named(wait_timeout_ms, pfdi_wait_timeout_ms, uint, 0444);
+MODULE_PARM_DESC(wait_timeout_ms,
+		 "Maximum time in ms to wait for an in-progress PFDI run");
 static int pfdi_to_linux_errno(int err)
 {
 	switch (err) {
@@ -95,6 +107,18 @@ static int pfdi_smc_feature(u32 smc_fid)
 	return (int)pfdi_smc_call(PFDI_FN_FEATURES, smc_fid, 0, 0, 0).a0;
 }
 
+static bool pfdi_fid_supported(u32 smc_fid)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(pfdi_supported_fids); i++) {
+		if (pfdi_supported_fids[i] == smc_fid)
+			return true;
+	}
+
+	return false;
+}
+
 static int pfdi_validate_cpu_features(void)
 {
 	unsigned int i;
@@ -275,6 +299,172 @@ static int pfdi_pe_fw_check(unsigned int cpu)
 	return pfdi_to_linux_errno(per_cpu(pfdi_worker_ctx, cpu).result);
 }
 
+static void pfdi_pe_get_result_fn(struct kthread_work *work)
+{
+	struct pfdi_cpu_worker *worker_ctx;
+
+	worker_ctx = container_of(work, struct pfdi_cpu_worker, work);
+	worker_ctx->smc_ret = pfdi_smc_call(PFDI_FN_PE_TEST_RESULT,
+					    0, 0, 0, 0);
+	complete(&worker_ctx->done);
+}
+
+static int pfdi_pe_get_result(unsigned int cpu, s64 *ft_id)
+{
+	int ret;
+	struct pfdi_cpu_worker *worker_ctx = &per_cpu(pfdi_worker_ctx, cpu);
+
+	ret = pfdi_thread_worker(cpu, pfdi_pe_get_result_fn,
+				 MAX_SCHEDULE_TIMEOUT);
+	if (ret)
+		return ret;
+
+	ret = (int)worker_ctx->smc_ret.a0;
+	if (ret == PFDI_RET_FAULT_FOUND)
+		*ft_id = worker_ctx->smc_ret.a1;
+
+	return pfdi_to_linux_errno(ret);
+}
+
+static void pfdi_pe_force_error_fn(struct kthread_work *work)
+{
+	struct pfdi_cpu_worker *worker_ctx;
+
+	worker_ctx = container_of(work, struct pfdi_cpu_worker, work);
+	worker_ctx->result = pfdi_smc_call(PFDI_FN_FORCE_ERROR,
+					   worker_ctx->error_info.smc_fid,
+					   worker_ctx->error_info.error_id,
+					   0, 0).a0;
+	complete(&worker_ctx->done);
+}
+
+static int pfdi_pe_force_error(unsigned int cpu,
+			       const struct pfdi_force_error *error_info)
+{
+	int ret;
+	struct pfdi_cpu_worker *worker_ctx = &per_cpu(pfdi_worker_ctx, cpu);
+
+	if (!pfdi_fid_supported(error_info->smc_fid))
+		return -EINVAL;
+
+	if (error_info->error_id < PFDI_RET_TEST_COUNT_ZERO ||
+	    error_info->error_id > SMCCC_RET_SUCCESS)
+		return -EINVAL;
+
+	worker_ctx->error_info = *error_info;
+
+	ret = pfdi_thread_worker(cpu, pfdi_pe_force_error_fn,
+				 MAX_SCHEDULE_TIMEOUT);
+	if (ret)
+		return ret;
+
+	return pfdi_to_linux_errno(worker_ctx->result);
+}
+
+static bool pfdi_ranges_equal(const struct pfdi_test_range *lhs,
+			      const struct pfdi_test_range *rhs)
+{
+	return lhs->start == rhs->start && lhs->end == rhs->end;
+}
+
+static bool pfdi_run_available(const struct pfdi_per_cpu_info *cpu_info)
+{
+	return !atomic_read(&cpu_info->run_inprogress);
+}
+
+static int pfdi_validate_test_range(unsigned int cpu,
+				    const struct pfdi_test_range *range)
+{
+	s64 count;
+	int ret;
+
+	if (range->start == -1 || range->end == -1)
+		return pfdi_ranges_equal(range,
+					 &(struct pfdi_test_range){ .start = -1,
+								    .end = -1 }) ?
+		       0 : -EINVAL;
+
+	if (range->start < 0 || range->end < 0 || range->start > range->end)
+		return -EINVAL;
+
+	ret = pfdi_pe_get_test_count(cpu, &count);
+	if (ret)
+		return ret;
+
+	if (range->start >= count || range->end >= count)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void pfdi_pe_run_fn(struct kthread_work *work)
+{
+	struct arm_smccc_res smc_ret;
+	struct pfdi_cpu_worker *worker_ctx;
+
+	worker_ctx = container_of(work, struct pfdi_cpu_worker, work);
+	smc_ret = pfdi_smc_call(PFDI_FN_PE_TEST_RUN,
+				worker_ctx->test_run.range.start,
+				worker_ctx->test_run.range.end, 0, 0);
+
+	if ((int)smc_ret.a0 == PFDI_RET_FAULT_FOUND)
+		worker_ctx->test_run.ft_id = smc_ret.a1;
+
+	worker_ctx->result = (int)smc_ret.a0;
+	complete(&worker_ctx->done);
+}
+
+static int pfdi_pe_run_tests(unsigned int cpu, struct pfdi_test_run *test_run)
+{
+	int ret;
+	unsigned long wait_timeout;
+	struct pfdi_cpu_worker *worker_ctx = &per_cpu(pfdi_worker_ctx, cpu);
+	struct pfdi_per_cpu_info *cpu_info = &per_cpu(pfdi_cpu_info, cpu);
+
+	ret = pfdi_validate_test_range(cpu, &test_run->range);
+	if (ret)
+		return ret;
+
+	wait_timeout = msecs_to_jiffies(pfdi_wait_timeout_ms);
+
+	mutex_lock(&cpu_info->state_lock);
+	while (atomic_read(&cpu_info->run_inprogress)) {
+		if (pfdi_ranges_equal(&test_run->range,
+				      &cpu_info->ongoing_run_range)) {
+			mutex_unlock(&cpu_info->state_lock);
+			return -EBUSY;
+		}
+
+		mutex_unlock(&cpu_info->state_lock);
+			ret = wait_event_interruptible_timeout(cpu_info->run_wait,
+							       pfdi_run_available(cpu_info),
+							       wait_timeout);
+		if (ret <= 0)
+			return ret ? ret : -ETIME;
+
+		mutex_lock(&cpu_info->state_lock);
+	}
+
+	atomic_set(&cpu_info->run_inprogress, 1);
+	cpu_info->ongoing_run_range = test_run->range;
+	worker_ctx->test_run = *test_run;
+	mutex_unlock(&cpu_info->state_lock);
+
+	ret = pfdi_thread_worker(cpu, pfdi_pe_run_fn, wait_timeout);
+
+	mutex_lock(&cpu_info->state_lock);
+	if (worker_ctx->result == PFDI_RET_FAULT_FOUND)
+		test_run->ft_id = worker_ctx->test_run.ft_id;
+	atomic_set(&cpu_info->run_inprogress, 0);
+	wake_up_all(&cpu_info->run_wait);
+	mutex_unlock(&cpu_info->state_lock);
+
+	if (ret)
+		return ret;
+
+	return pfdi_to_linux_errno(worker_ctx->result);
+}
+
 static int arm_pfdi_open(struct inode *inode, struct file *file)
 {
 	struct miscdevice *misc_dev = file->private_data;
@@ -310,9 +500,12 @@ static long arm_pfdi_ioctl(struct file *file, unsigned int cmd,
 	u32 feature_fid;
 	u32 version;
 	s64 count;
+	s64 ft_id;
 	u64 lib_info;
 	struct miscdevice *misc_dev = file->private_data;
 	struct pfdi_dev_data *device_data;
+	struct pfdi_test_run test_run;
+	struct pfdi_force_error error_info;
 	unsigned int cpu;
 
 	if (!misc_dev || !misc_dev->this_device)
@@ -350,9 +543,35 @@ static long arm_pfdi_ioctl(struct file *file, unsigned int cmd,
 					 sizeof(count)))
 			err = -EFAULT;
 		break;
+	case PFDI_IOCTL_PE_TEST_RUN:
+		if (copy_from_user(&test_run, (void __user *)arg,
+				   sizeof(test_run)))
+			return -EFAULT;
+
+		err = pfdi_pe_run_tests(cpu, &test_run);
+		if (err == -EFAULT &&
+		    copy_to_user((void __user *)arg, &test_run,
+				 sizeof(test_run)))
+			err = -EFAULT;
+		break;
+	case PFDI_IOCTL_PE_TEST_RESULT:
+		err = pfdi_pe_get_result(cpu, &ft_id);
+		if (err == -EFAULT && copy_to_user((void __user *)arg, &ft_id,
+						   sizeof(ft_id)))
+			err = -EFAULT;
+		break;
 	case PFDI_IOCTL_FW_CHECK:
 		err = pfdi_pe_fw_check(cpu);
 		break;
+	case PFDI_IOCTL_FORCE_ERROR:
+		if (copy_from_user(&error_info, (void __user *)arg,
+				   sizeof(error_info)))
+			return -EFAULT;
+		if (error_info.reserved)
+			return -EINVAL;
+
+		err = pfdi_pe_force_error(cpu, &error_info);
+		break;
 	default:
 		err = -ENOTTY;
 		break;
@@ -413,6 +632,9 @@ static int arm_pfdi_device_create(unsigned int cpu)
 
 	sema_init(&per_cpu(pfdi_cpu_info, cpu).open_sem, 1);
 	mutex_init(&worker_ctx->worker_lock);
+	atomic_set(&per_cpu(pfdi_cpu_info, cpu).run_inprogress, 0);
+	mutex_init(&per_cpu(pfdi_cpu_info, cpu).state_lock);
+	init_waitqueue_head(&per_cpu(pfdi_cpu_info, cpu).run_wait);
 	init_completion(&worker_ctx->done);
 	per_cpu(pfdi_worker, cpu) =
 		kthread_create_worker_on_cpu(cpu, 0, "pfdi/%u");
@@ -447,6 +669,9 @@ static int arm_pfdi_device_destroy(unsigned int cpu)
 {
 	struct miscdevice *misc_dev = &per_cpu(pfdi_misc_device, cpu);
 
+	if (atomic_read(&per_cpu(pfdi_cpu_info, cpu).run_inprogress) > 0)
+		return -EBUSY;
+
 	if (per_cpu(pfdi_worker, cpu)) {
 		kthread_flush_worker(per_cpu(pfdi_worker, cpu));
 		kthread_destroy_worker(per_cpu(pfdi_worker, cpu));

-- 
2.43.0


