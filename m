Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0A0606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vYgZhXTS;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=bwzfwxUa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WJfLh02jhGDmJ0EUFJgx7atkBkA7JgkXwKZPwWOi/vA=; b=vYgZhXTSyybrrL
	v7+nvNHhb/ADR4bcbZL/Y3habBgMJv/8M2AVJMbD7bV7VxhVTIZx2RwetDVr6Nl6YPUk3WbXIaN+o
	vJAnpyPepxq9UCjy+nvV2cIMGR4niBNsZQIJVMSF0e7kk6wN44C8mH/C6KQ0GEkUIExB7Ec/pn3GO
	jsFkpTp9hkIbKwfE5uRJ29q3Fhy6DD+PTgNlbttTk4fuh19/ng3ViFBcsDlwb2SZyw2AXRs702VxU
	STBTqgxurGDekDzotzbO3APe0SaeW3jqVhBsjk3mLEdKY0hs0QuKHF1tlgu16i52Fg4nk6kMY4giq
	mrpuR1EQe0KdmqZoShUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4BT-0000000CULo-0SeP;
	Thu, 19 Nov 2026 15:36:23 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4BJ-0000000CUKY-3uiq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:36:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-490f38e9688so911584f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 07:36:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795102571; cv=none;
        d=google.com; s=arc-20260327;
        b=k0OC0icWU8wE5sy3dfsMUHynfINMLRnipnPYj9fJwr+T1GVP1s90w7gRo06Ww8aJM8
         T2VPzRRr8TTr5mo6xnNBa/Ly4mwNI4l3kpdzzqPnUyhVl+okaaWfemrGdySINDd9qVWJ
         ah+7b89NfP/qsIfKPGN5my+x86v48UsKrrVzawE7gcwW8FquxMvYVS7XA33+Xgagrmui
         ewE8wi6QylwTBIJrul/tYj2uQiqOWp8P1xWJu0q8dlhS0QKmyKgoDmvrlLySZmC8jfLi
         4nV2ngRrYgp8/T/ApwycxmfcWXkGKAZ/wMrGwmnYnJMBx7Z70MPXaBxcDlCVS1CdmOr7
         DnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WJfLh02jhGDmJ0EUFJgx7atkBkA7JgkXwKZPwWOi/vA=;
        fh=X/X8ZELlqiUSz/FyegMtuYkjCapZFpntnlbIO7L0sDo=;
        b=JPtLXpOEEpkX1iq8bjkh5CA63+ocBv+qdMUesni9hQPqL/22Bu4QYffaG/dutaRXyu
         rO4q+cm33CbUxVZHMsTb34OeR7q4mu6Oy5yTR0tQecnOyaePuNpsGbiviT7vCo61Aibd
         wtZFQ3PdgPrld3S/y8llhrPzvXLzuiln4FEuraen/CwAgUT4mUnfXXazSI/0k7P/KqMQ
         BKTO31OUQzHVk0PZfNhMS8dHc2FgK+jMEUylYIKPfG/Bzq6cDdhoULjFYTMDyXvO2xhs
         t5nL0ryzt1NovPqlU/CFrprWfoeJce1zmGK7oDKoKNKEZchbuFI3cIJ0OO5Fn2KX5vdD
         rCwA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795102571; x=1795707371; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WJfLh02jhGDmJ0EUFJgx7atkBkA7JgkXwKZPwWOi/vA=;
        b=bwzfwxUawClNzuerMk+QaN/GJYHdDz4IKCtupNJz9aJZ0kgQfo62DIqJ3GTZvygGR+
         U3qJoBxDfMV18vMylSqQcb33pY3SMpjDIazbd29tBLuETVpzuArgulNIxfBRS7fJDVeK
         q4Ax68f7QgT8tcQd19+Z2VT1NjI9zzbxFGfcLx6O4DY+MzPJVDffQxtv6oyk81QkyMRK
         tv8dprr5iR1PMUCJBrH3T41j8XcMVxDYmpqmNgAyOA5Pp/dKD+cZ9/RTvj7F1jY9qaLL
         HRRfut2yk9yFxSdPvSxiLYNNBwE9lyZtvq4MmVihsvOte4Mu2xABj67ACLF+s+eGaaBb
         l4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102571; x=1795707371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WJfLh02jhGDmJ0EUFJgx7atkBkA7JgkXwKZPwWOi/vA=;
        b=Ep2XwsNH7mvy9o5h4/ia2VUM5I/KdYCs4PpXwGVKb3Q5nF7yDIiddE19uuZQTOTUtV
         SrgUYVbAQtuwxe3adlaDHO6m4TAaB918nMLZK6OWBvxgpyFs9nW/hgnO/jDzCL4OqjPD
         qcWIs14U0o+kuvVOYUSLF6RTKJ0r7pI/ax6G//wN6OezE2mPw2t9lCs2nNbMc+qB+bns
         CSdm+Teg0J3LHSxeRa56ir28q+GHDQ7NnDBsWuIKMhQ+qLZd0gF4G16D/wjA5LV/VnEY
         7CebrwtdG0jI0BXaeg1jrGHDOidEZVVRJFNoDCYTS6xlSzBtkjaYpSGtxA+vFMxGLpXg
         gtSA==
X-Forwarded-Encrypted: i=1; AL+hErF5NV8yYLZasrcqQwJ8OOxzLevUfCybNb7LSa7GUoIacYm9aW1TpTHDtb8/+nlzkkl8QicEvpbQnya/bdV0qPBv@lists.infradead.org
X-Gm-Message-State: APuU4Z9XQ4MziYf89CTJRTre+ZgjxaXj3e3wR6IMW+ryyva4U4cltRX0
	DO3xKu9kBCIQvusgVXdCRaf66en5vNUf74DYNd9jNKqkjoWhNEv9bh//CPQP3yyNPbtr7FgWy9M
	+bqeNxm/0qZSzNVDlXM0CUJp3pTOlx1z1Ns10UieFtQ==
X-Gm-Gg: AZFdTZchzBNYPY6sLa1h8jyFhc27iv4JQ+Dae4YY2sEB0gAtQEs+bbwsH7bFM8+zNru
	jg8khWN/jIm9id9cfkcmSjfC9l38nmD+fF+p9kiiKEYRxCI94vUOEmHIQKJxblBdsuFYpPYYb9V
	PUQX+5MbxoFGkObNLLwiCt00/SPX8YoLLncK+z+H4wbMaR8KSudWau/N4P7VZQ/MN3iiNjLIjwR
	VcvlGlItkgkP979UzAv40MZKRL0mn9iaNq1RApr0kLwtoZCgiVXOiBJyKVaj0h/NVn1Xs7mpCOq
	I6llYzAJ9SkIZiAcK/vnJ2xrPsxbapH4xfzzXXLqMFTpHnXb8tBoZ1bJbd7QKVGAD8jqXeMZ6v0
	AU5cQZFdDjZy6INmiGnKJ0tmkVZrxyaPW8krRUFg3pHTSkWJ7BCwITr2RQrCZw1NETA3wiHffAr
	ncsf0zOTIZuYIDKC0YHC3gXYd12FH3yA9d6g9nO/l8eY5Mlpk8+np60Vg=
X-Received: by 2002:a05:6000:2903:b0:491:c392:1f31 with SMTP id
 ffacd0b85a97d-4aa5ab788d1mr3852229f8f.28.1795102571521; Thu, 19 Nov 2026
 07:36:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-7-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-7-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 21:05:59 +0530
X-Gm-Features: Aa3M54rnDKWA8w7Y4rJmmE_fS3tPOuMM_ZzdffiEjwoFDQtL4x53zCglx7T-XA4
Message-ID: <CAAhSdy1sQcepYMT52e211e9nKTwDA8FXC1P2KhTAjU8rTYQTzg@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] riscv: pmu: Integrate CTR Ext support in
 riscv_pmu_dev driver
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atishp@rivosinc.com, anup.patel@oss.qualcomm.com, 
	will@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	beeman@rivosinc.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	devicetree@vger.kernel.org, Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_073614_035832_CFAE8DB7 
X-CRM114-Status: GOOD (  27.38  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 3:21=E2=80=AFPM Vikram Singh
<vikram.singh3@oss.qualcomm.com> wrote:
>
> This integrates recently added CTR ext support in riscv_pmu_dev driver
> to enable branch stack sampling using PMU events.
>
> This mainly adds CTR enable/disable callbacks in rvpmu_ctr_stop()
> and rvpmu_ctr_start() function to start/stop branch recording along
> with the event.
>
> PMU overflow handler rvpmu_ovf_handler() is also updated to sample
> CTR entries in case of the overflow for the particular event programmed
> to records branches. The recorded entries are fed to core perf for
> further processing.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-7-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  drivers/perf/riscv_pmu.c     |  2 +-
>  drivers/perf/riscv_pmu_sbi.c | 72 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 70 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index d4826eb73b16..fa9ae4e659d2 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -327,7 +327,7 @@ static int riscv_pmu_event_init(struct perf_event *ev=
ent)
>         uint64_t cmask;
>
>         /* driver does not support branch stack sampling */
> -       if (has_branch_stack(event))
> +       if (has_branch_stack(event) && !riscv_pmu_ctr_supported(rvpmu))
>                 return -EOPNOTSUPP;
>
>         hwc->flags =3D 0;
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index b14b3acf7567..637b9d97e20a 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -678,6 +678,9 @@ static int pmu_sbi_event_map(struct perf_event *event=
, u64 *econfig)
>          */
>         flush_work(&check_std_events_work);
>
> +       if (needs_branch_stack(event) && !riscv_pmu_ctr_valid(event))
> +               return -EOPNOTSUPP;
> +
>         return riscv_pmu_get_event_info(type, config, econfig);
>  }
>
> @@ -827,10 +830,14 @@ static void pmu_sbi_reset_scounteren(void *arg)
>
>  static void pmu_sbi_ctr_add(struct perf_event *event, int flags)
>  {
> +       if (needs_branch_stack(event))
> +               riscv_pmu_ctr_add(event);
>  }
>
>  static void pmu_sbi_ctr_del(struct perf_event *event, int flags)
>  {
> +       if (needs_branch_stack(event))
> +               riscv_pmu_ctr_del(event);
>  }
>
>  static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
> @@ -847,6 +854,10 @@ static void pmu_sbi_ctr_start(struct perf_event *eve=
nt, u64 ival)
>         ret =3D sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_START, hwc->id=
x,
>                         1, flag, ival);
>  #endif
> +
> +       if (needs_branch_stack(event))
> +               riscv_pmu_ctr_enable(event);
> +
>         if (ret.error && (ret.error !=3D SBI_ERR_ALREADY_STARTED))
>                 pr_err("Starting counter idx %d failed with error %d\n",
>                         hwc->idx, sbi_err_map_linux_errno(ret.error));
> @@ -864,6 +875,9 @@ static void pmu_sbi_ctr_stop(struct perf_event *event=
, unsigned long flag)
>         struct cpu_hw_events *cpu_hw_evt =3D this_cpu_ptr(pmu->hw_events)=
;
>         struct riscv_pmu_snapshot_data *sdata =3D cpu_hw_evt->snapshot_ad=
dr;
>
> +       if (needs_branch_stack(event) && flag !=3D RISCV_PMU_STOP_FLAG_RE=
SET)
> +               riscv_pmu_ctr_disable(event);
> +
>         if ((hwc->flags & PERF_EVENT_FLAG_USER_ACCESS) &&
>             (hwc->flags & PERF_EVENT_FLAG_USER_READ_CNT))
>                 pmu_sbi_reset_scounteren((void *)event);
> @@ -896,7 +910,7 @@ static void pmu_sbi_ctr_stop(struct perf_event *event=
, unsigned long flag)
>  static void pmu_sbi_sched_task(struct perf_event_pmu_context *pmu_ctx, s=
truct task_struct *task,
>                                bool sched_in)
>  {
> -       /* Call CTR specific Sched hook. */
> +       riscv_pmu_ctr_sched_task(pmu_ctx, task, sched_in);
>  }
>
>  static int pmu_sbi_find_num_ctrs(void)
> @@ -1179,6 +1193,12 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, vo=
id *dev)
>                 hw_evt->state |=3D PERF_HES_UPTODATE;
>                 perf_sample_data_init(&data, 0, hw_evt->last_period);
>                 if (riscv_pmu_event_set_period(event)) {
> +                       if (needs_branch_stack(event)) {
> +                               riscv_pmu_ctr_consume(cpu_hw_evt, event);
> +                               perf_sample_save_brstack(&data, event,
> +                                                        &cpu_hw_evt->bra=
nches->branch_stack, NULL);
> +                       }
> +
>                         /*
>                          * Unlike other ISAs, RISC-V don't have to disabl=
e interrupts
>                          * to avoid throttling here. As per the specifica=
tion, the
> @@ -1222,6 +1242,8 @@ static int pmu_sbi_starting_cpu(unsigned int cpu, s=
truct hlist_node *node)
>                 enable_percpu_irq(riscv_pmu_irq, IRQ_TYPE_NONE);
>         }
>
> +       riscv_pmu_ctr_starting_cpu();
> +
>         if (sbi_pmu_snapshot_available())
>                 return pmu_sbi_snapshot_setup(pmu, cpu);
>
> @@ -1237,6 +1259,8 @@ static int pmu_sbi_dying_cpu(unsigned int cpu, stru=
ct hlist_node *node)
>         /* Disable all counters access for user mode now */
>         csr_write(CSR_SCOUNTEREN, 0x0);
>
> +       riscv_pmu_ctr_dying_cpu();
> +
>         if (sbi_pmu_snapshot_available())
>                 return pmu_sbi_snapshot_disable();
>
> @@ -1367,7 +1391,30 @@ static void riscv_pmu_destroy(struct riscv_pmu *pm=
u)
>                 cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING,=
 &pmu->node);
>  }
>
> -static void pmu_sbi_event_init(struct perf_event *event)
> +static int branch_records_alloc(struct riscv_pmu *pmu)
> +{
> +       struct branch_records __percpu *tmp_alloc_ptr;
> +       struct branch_records *records;
> +       struct cpu_hw_events *events;
> +       int cpu;
> +
> +       if (!riscv_pmu_ctr_supported(pmu))
> +               return 0;
> +
> +       tmp_alloc_ptr =3D alloc_percpu_gfp(struct branch_records, GFP_KER=
NEL);
> +       if (!tmp_alloc_ptr)
> +               return -ENOMEM;
> +
> +       for_each_possible_cpu(cpu) {
> +               events =3D per_cpu_ptr(pmu->hw_events, cpu);
> +               records =3D per_cpu_ptr(tmp_alloc_ptr, cpu);
> +               events->branches =3D records;
> +       }
> +
> +       return 0;
> +}
> +
> +static int pmu_sbi_event_init(struct perf_event *event)
>  {
>         /*
>          * The permissions are set at event_init so that we do not depend
> @@ -1379,6 +1426,11 @@ static void pmu_sbi_event_init(struct perf_event *=
event)
>                 event->hw.flags |=3D PERF_EVENT_FLAG_USER_ACCESS;
>         else
>                 event->hw.flags |=3D PERF_EVENT_FLAG_LEGACY;
> +
> +       if (branch_sample_call_stack(event))
> +               event->attach_state |=3D PERF_ATTACH_TASK_DATA;
> +
> +       return 0;
>  }
>
>  static void pmu_sbi_event_mapped(struct perf_event *event, struct mm_str=
uct *mm)
> @@ -1516,9 +1568,16 @@ static int pmu_sbi_device_probe(struct platform_de=
vice *pdev)
>                 pmu->pmu.capabilities |=3D PERF_PMU_CAP_NO_EXCLUDE;
>         }
>         irq_requested =3D (ret =3D=3D 0);
> -
>         pmu->pmu.attr_groups =3D riscv_pmu_attr_groups;
>         pmu->pmu.parent =3D &pdev->dev;
> +       ret =3D riscv_pmu_ctr_init(pmu);
> +       if (ret)
> +               goto out_free;
> +
> +       ret =3D branch_records_alloc(pmu);
> +       if (ret)
> +               goto out_ctr_finish;
> +
>         bitmap_copy(pmu->cmask, cmask, RISCV_MAX_COUNTERS);
>         pmu->ctr_add =3D pmu_sbi_ctr_add;
>         pmu->ctr_del =3D pmu_sbi_ctr_del;
> @@ -1535,6 +1594,10 @@ static int pmu_sbi_device_probe(struct platform_de=
vice *pdev)
>         pmu->csr_index =3D pmu_sbi_csr_index;
>         pmu->sched_task =3D pmu_sbi_sched_task;
>
> +       ret =3D cpuhp_state_add_instance(CPUHP_AP_PERF_RISCV_STARTING, &p=
mu->node);
> +       if (ret)
> +               goto out_ctr_finish;
> +
>         ret =3D riscv_pm_pmu_register(pmu);
>         if (ret)
>                 goto out_destroy;
> @@ -1592,6 +1655,9 @@ static int pmu_sbi_device_probe(struct platform_dev=
ice *pdev)
>                 riscv_pmu_irq =3D 0;
>         }
>
> +out_ctr_finish:
> +       riscv_pmu_ctr_finish(pmu);
> +
>  out_free:
>         free_percpu(pmu->hw_events);
>         kfree(pmu_ctr_list);
> --
> 2.43.0
>

Regards,
Anup

