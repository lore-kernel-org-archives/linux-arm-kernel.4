Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E0606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zZbEQK86;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=V61pZgrU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CZqy6xFABQEyD7CGf6Z9ErvSDunlUYlFbbHfyyFxeho=; b=zZbEQK86Pny8AC
	kZ2uTE39TxXpI7hJ4cyq3IFXeMWhCB3pgi7jVGyEuYQRvz6/j37z9UqkWXovVML4P6bL24Ffxq7xs
	uExMwcu7BNvE+DAmFM21u5OjnqskFEVyZwg0a/Y8mbBlR0XVbmSlkiZXfhKpTN0/Uq6PzEybMJ2f1
	aruw6Xz0A2lzgopxOlJvpeX2f2+KADPzH7+6awpH3D3ZhS+7sbX1PgdCebbZNFDdjPXNtKmtkY1yX
	n7JuZI3ZrB9YGGH/KjkidOVqkIu1A4yLFVr/VYaLsxegA8OA3vIg/8dgEE7V5w03zFk1+5f1HIznB
	gKq2tJKXuQowmRdYaa0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU42m-0000000CRmC-2Wtr;
	Thu, 19 Nov 2026 15:27:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU42k-0000000CRl8-2IEr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:27:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so19021195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 07:27:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795102040; cv=none;
        d=google.com; s=arc-20260327;
        b=eJl8ht38vTF7AUwX/IJWFfr/zLXDOa59Fv7D19vYv1JN6mfMuJZoVJQkq6q4qCrG8r
         EY5aG+7EuchMmry2LIdns39nRUc2qJh8IIZHYWIpo6t/PEjVzZkX3Gv/hrV/Dsy0aphU
         Cu5lsU45XLvcMhHxp5wuoSTB9doWp52L6lrqHJ7baaL0MQ/Ne3g1Yeqo6nQeGF5wIp7Y
         JOfaU9/BKrrzrrrFP4O3DjWEcNnyp5xcymINe+ODD4MykT19K6if/1FC+gIa5fPC2iPO
         /PWr63gFUO9pA63BXwXk5RaacH1HWSShazP05c4Mq8KF2jVkorVDP1ek2GuVGkzS1Cy2
         iPUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CZqy6xFABQEyD7CGf6Z9ErvSDunlUYlFbbHfyyFxeho=;
        fh=y7uuiAbCYWBFkLRuZh+gplJbTpB8RMUcPRCemBLfKgk=;
        b=QK+nIb9dJ6iXIIX6zXU5un7VwcgW40zt6PAeN3lsp59+yZNonksUGtGxTiiWaQKPVu
         twXz5tJ7diR6G+ztgl3/ZsdbmWOEUO+9PL/eodDK5rHBBLys0EhCMl3KNQfWA4Wyqf7A
         iBxRMxF3guVLSoJ1kH1GVUt7CYQlxlSAN5waXBBSzPNdEI98iiXxVY7aGfuIMNy/TzXF
         HpA1Q/8b5TKUck2z2lG7+bsNMwrLcYZN7FLRJL6NTB5uAblh56eXR2kHL3z6DI0GF1ad
         poEdlqKvjw+SpS1YSMLEN2VWxlZENTFJxvjaJuW7FLf4z4cPqCBVh5ncWGzXkB+qFjcz
         sCRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795102040; x=1795706840; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CZqy6xFABQEyD7CGf6Z9ErvSDunlUYlFbbHfyyFxeho=;
        b=V61pZgrUSYkiWnOd60nD+sFT7bfrdkFqNJcffqVsAYX9R8GY5tjrdeaOyrgUWg0VJ0
         D4eehhVu5W9Lp8NkpmgrLpBLEQ4rM+lTJ7B2wgOyNF8mqwHPPS76y/LcdTJe0uWQFube
         9Pycx9VyV3eciRyNV0lq70x0SzCGpEzEOhxTE3y46ddISWSsrUTokla/vtb5drNVnPMx
         v9ufQRIbH4QUOIfXUHsmvSQYw0D8ttZmlHE0ox4EW6kPBf93YlM6HfGxDdtQvd6vpZ/m
         9CnsEiyFWursjVORXNC5ph5t1wbF787V/HJvU0ZQigH/a0+tL0i2kwbeW/pQz6Q9w5Nv
         O9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102040; x=1795706840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZqy6xFABQEyD7CGf6Z9ErvSDunlUYlFbbHfyyFxeho=;
        b=S5Pe/VtPMUHRhkBUXhhHueflSbiobDg5LslVe9LPwRf+aHxOWpL1etr/QuPNTjNvqq
         tXY3MxKgok09tvneS2mmXtv7nWMyX4I/tFpKzS/fLlBipxWc72k9SoR7piVuEhkuoDMF
         QLuFNLYzI9WYIOqtdFxEa1EAQ8TiYmeltUI8bzXy3C9LRvMxG4QaRjY7qBppl/EMfUAV
         +drjzh8haq9oR5eUa8UZHz0ZQw8kUwul/NPs38zqSPNSatvlY/i8niRpqdKyZ+xaZUcb
         Aq0aH/+uzintI5//Zg3/uzAQFcRuE4RmoH+g2uOGXQx9YaWwEqUHuwgyfcnBrHQZtwfo
         qpXw==
X-Forwarded-Encrypted: i=1; AL+hErEjYMNqIQYIgJ5ct1EiKFZSHzqbbh7/k6mE/ScbPx4mPx7+8wSfliXNN/u+s4TIvBrqPrvQbkPBabIOt3bSdDfF@lists.infradead.org
X-Gm-Message-State: APuU4Z+eOtise6GcdX1aEQ57i15IrDBLCobYxUmal5JL1NCDoV2iQCKX
	SECWFUo9E91e8uWCCGdqR0D+MeQDPkvS0XMmkQW1cL6BwvcJySfaRszJAGoztas/0gW0zw9yBFP
	5kqsBUBn+rQFsJI92sYn5boJYVooJ7SXVxeAI6A2Nhg==
X-Gm-Gg: AYBFou1vt3nguLREC92HMbu6+IEnk3nIgIBrVlUC54YCOC6UnKJcUlMitTEa1RmO6fv
	KQcCF3gh/Iakj9xC3gYjHpkhCDuDb5DCcgldI0QpGLGYZ2Ln/a2CUiTBswG9fcCBI7ZQHJ/zwoK
	7acGXlGaRc65s+ycStRScLufmoLFcMTLdxddjgLT7QQKNl7qToOLSRyPIclnp4ZEfVcF2DLX9Kw
	EXqmxGnvqPsQfGSSvX+jMCz1wiGMkGukTyO4iH/y1FAlliLwMLfQgO+l9pkn/+gkeOFfNPO23Hr
	9+S6Gsb5dKFoTnt2g9oQgV7NZ8VAqGYwlLdyK5zCoS6wiPIVYB/xK+bj6foLvd7aYi/vUaTwjBo
	ALS2c08hn4RRMSnPb4JS2ajx+2a/+QfzafV0MzPcpp2k/Z2cwpH8dOyl9mJwdCHyJ4sUcACWzMd
	fPxsGxrfSG/LYKomGvhfkjcC5jGpDUbjANUxxrldNkcglAYs5Kzch6S8k=
X-Received: by 2002:a05:600c:154a:b0:4bb:6b6b:fbaa with SMTP id
 5b1f17b1804b1-4bb7da12ab1mr128048755e9.16.1795102039017; Thu, 19 Nov 2026
 07:27:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-5-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-5-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:57:07 +0530
X-Gm-Features: Aa3M54rZEbG4RNdS6O1BRxLO3kDHI5P1qMQJ1pxxqQiXGApFrfCV5-bLcT-cUmk
Message-ID: <CAAhSdy1fx4uJJTTamoyOjojh+ApdZmPVh9nd==NcfM6fTCoOvQ@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] riscv: pmu: Add infrastructure for Control
 Transfer Record
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
X-CRM114-CacheID: sfid-20261119_072722_666993_73DD8A02 
X-CRM114-Status: GOOD (  28.11  )
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
> To support Control Transfer Records (CTR) extension, we need to extend th=
e
> riscv_pmu framework with some basic infrastructure for branch stack
> sampling. Subsequent patches will use this to add support for CTR in the
> riscv_pmu_dev driver.
>
> With CTR, the branches are stored into a hardware FIFO, which will be
> sampled by software when perf events overflow. A task may be
> context-switched between overflows, and to avoid leaking samples we need
> to clear the last task's records when a task is context-switched in.
> To do this we will be using the pmu::sched_task() callback added in this
> patch.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-5-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  drivers/perf/riscv_pmu.c        | 19 +++++++++++++++++++
>  drivers/perf/riscv_pmu_legacy.c |  2 ++
>  drivers/perf/riscv_pmu_sbi.c    | 17 +++++++++++++++++
>  include/linux/perf/riscv_pmu.h  | 23 +++++++++++++++++++++--
>  4 files changed, 59 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
> index 8e3cd0f35336..d4826eb73b16 100644
> --- a/drivers/perf/riscv_pmu.c
> +++ b/drivers/perf/riscv_pmu.c
> @@ -157,6 +157,19 @@ u64 riscv_pmu_ctr_get_width_mask(struct perf_event *=
event)
>         return GENMASK_ULL(cwidth, 0);
>  }
>
> +static void riscv_pmu_sched_task(struct perf_event_pmu_context *pmu_ctx,=
 struct task_struct *task,
> +                                bool sched_in)
> +{
> +       struct riscv_pmu *pmu;
> +
> +       if (!pmu_ctx)
> +               return;
> +
> +       pmu =3D to_riscv_pmu(pmu_ctx->pmu);
> +       if (pmu->sched_task)
> +               pmu->sched_task(pmu_ctx, task, sched_in);
> +}
> +
>  u64 riscv_pmu_event_update(struct perf_event *event)
>  {
>         struct riscv_pmu *rvpmu =3D to_riscv_pmu(event->pmu);
> @@ -269,6 +282,8 @@ static int riscv_pmu_add(struct perf_event *event, in=
t flags)
>         cpuc->events[idx] =3D event;
>         cpuc->n_events++;
>         hwc->state =3D PERF_HES_UPTODATE | PERF_HES_STOPPED;
> +       if (rvpmu->ctr_add)
> +               rvpmu->ctr_add(event, flags);
>         if (flags & PERF_EF_START)
>                 riscv_pmu_start(event, PERF_EF_RELOAD);
>
> @@ -290,6 +305,8 @@ static void riscv_pmu_del(struct perf_event *event, i=
nt flags)
>         if (rvpmu->ctr_stop)
>                 rvpmu->ctr_stop(event, RISCV_PMU_STOP_FLAG_RESET);
>         cpuc->n_events--;
> +       if (rvpmu->ctr_del)
> +               rvpmu->ctr_del(event, flags);
>         if (rvpmu->ctr_clear_idx)
>                 rvpmu->ctr_clear_idx(event);
>         perf_event_update_userpage(event);
> @@ -402,6 +419,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
>         for_each_possible_cpu(cpuid) {
>                 cpuc =3D per_cpu_ptr(pmu->hw_events, cpuid);
>                 cpuc->n_events =3D 0;
> +               cpuc->ctr_users =3D 0;
>                 for (i =3D 0; i < RISCV_MAX_COUNTERS; i++)
>                         cpuc->events[i] =3D NULL;
>                 cpuc->snapshot_addr =3D NULL;
> @@ -416,6 +434,7 @@ struct riscv_pmu *riscv_pmu_alloc(void)
>                 .start          =3D riscv_pmu_start,
>                 .stop           =3D riscv_pmu_stop,
>                 .read           =3D riscv_pmu_read,
> +               .sched_task     =3D riscv_pmu_sched_task,
>         };
>
>         return pmu;
> diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_leg=
acy.c
> index 1b8e4789cb3c..5214e90c61a6 100644
> --- a/drivers/perf/riscv_pmu_legacy.c
> +++ b/drivers/perf/riscv_pmu_legacy.c
> @@ -115,6 +115,8 @@ static void pmu_legacy_init(struct riscv_pmu *pmu)
>         set_bit(RISCV_PMU_LEGACY_INSTRET, pmu->cmask);
>         pmu->ctr_start =3D pmu_legacy_ctr_start;
>         pmu->ctr_stop =3D NULL;
> +       pmu->ctr_add =3D NULL;
> +       pmu->ctr_del =3D NULL;
>         pmu->event_map =3D pmu_legacy_event_map;
>         pmu->ctr_get_idx =3D pmu_legacy_ctr_get_idx;
>         pmu->ctr_get_width =3D pmu_legacy_ctr_get_width;
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 21a2078eab98..b14b3acf7567 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -825,6 +825,14 @@ static void pmu_sbi_reset_scounteren(void *arg)
>                           csr_read(CSR_SCOUNTEREN) & ~BIT(pmu_sbi_csr_ind=
ex(event)));
>  }
>
> +static void pmu_sbi_ctr_add(struct perf_event *event, int flags)
> +{
> +}
> +
> +static void pmu_sbi_ctr_del(struct perf_event *event, int flags)
> +{
> +}
> +
>  static void pmu_sbi_ctr_start(struct perf_event *event, u64 ival)
>  {
>         struct sbiret ret;
> @@ -885,6 +893,12 @@ static void pmu_sbi_ctr_stop(struct perf_event *even=
t, unsigned long flag)
>         }
>  }
>
> +static void pmu_sbi_sched_task(struct perf_event_pmu_context *pmu_ctx, s=
truct task_struct *task,
> +                              bool sched_in)
> +{
> +       /* Call CTR specific Sched hook. */
> +}
> +
>  static int pmu_sbi_find_num_ctrs(void)
>  {
>         struct sbiret ret;
> @@ -1506,6 +1520,8 @@ static int pmu_sbi_device_probe(struct platform_dev=
ice *pdev)
>         pmu->pmu.attr_groups =3D riscv_pmu_attr_groups;
>         pmu->pmu.parent =3D &pdev->dev;
>         bitmap_copy(pmu->cmask, cmask, RISCV_MAX_COUNTERS);
> +       pmu->ctr_add =3D pmu_sbi_ctr_add;
> +       pmu->ctr_del =3D pmu_sbi_ctr_del;
>         pmu->ctr_start =3D pmu_sbi_ctr_start;
>         pmu->ctr_stop =3D pmu_sbi_ctr_stop;
>         pmu->event_map =3D pmu_sbi_event_map;
> @@ -1517,6 +1533,7 @@ static int pmu_sbi_device_probe(struct platform_dev=
ice *pdev)
>         pmu->event_mapped =3D pmu_sbi_event_mapped;
>         pmu->event_unmapped =3D pmu_sbi_event_unmapped;
>         pmu->csr_index =3D pmu_sbi_csr_index;
> +       pmu->sched_task =3D pmu_sbi_sched_task;
>
>         ret =3D riscv_pm_pmu_register(pmu);
>         if (ret)
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pm=
u.h
> index ecaa40370830..c748a06ad751 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -28,6 +28,15 @@
>
>  #define RISCV_PMU_CONFIG1_GUEST_EVENTS 0x1
>
> +struct sse_event;
> +

Drop this forward declaration of "struct sse_event" and the
subsequent newline.

> +#define MAX_BRANCH_RECORDS 256
> +
> +struct branch_records {
> +       struct perf_branch_stack branch_stack;
> +       struct perf_branch_entry branch_entries[MAX_BRANCH_RECORDS];
> +};
> +
>  struct cpu_hw_events {
>         /* currently enabled events */
>         int                     n_events;
> @@ -47,6 +56,11 @@ struct cpu_hw_events {
>         bool snapshot_set_done;
>         /* A shadow copy of the counter values to avoid clobbering during=
 multiple SBI calls */
>         u64 snapshot_cval_shcopy[RISCV_MAX_COUNTERS];
> +       /* Saved branch records. */
> +       struct branch_records *branches;
> +

Drop the redundant newline.

> +       /* Active events requesting branch records */
> +       int ctr_users;
>  };
>
>  struct riscv_pmu {
> @@ -60,17 +74,22 @@ struct riscv_pmu {
>         int             (*ctr_get_idx)(struct perf_event *event);
>         int             (*ctr_get_width)(int idx);
>         void            (*ctr_clear_idx)(struct perf_event *event);
> +       void            (*ctr_add)(struct perf_event *event, int flags);
> +       void            (*ctr_del)(struct perf_event *event, int flags);
>         void            (*ctr_start)(struct perf_event *event, u64 init_v=
al);
>         void            (*ctr_stop)(struct perf_event *event, unsigned lo=
ng flag);
>         int             (*event_map)(struct perf_event *event, u64 *confi=
g);
> -       void            (*event_init)(struct perf_event *event);
> +       int             (*event_init)(struct perf_event *event);
>         void            (*event_mapped)(struct perf_event *event, struct =
mm_struct *mm);
>         void            (*event_unmapped)(struct perf_event *event, struc=
t mm_struct *mm);
>         uint8_t         (*csr_index)(struct perf_event *event);
> -
> +       void            (*sched_task)(struct perf_event_pmu_context *ctx,=
 struct task_struct *task,
> +                                     bool sched_in);
>         struct cpu_hw_events    __percpu *hw_events;
>         struct hlist_node       node;
>         struct notifier_block   riscv_pm_nb;
> +
> +       unsigned int    ctr_depth;
>  };
>
>  #define to_riscv_pmu(p) (container_of(p, struct riscv_pmu, pmu))
> --
> 2.43.0
>

Regards,
Anup

