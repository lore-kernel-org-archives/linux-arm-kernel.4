Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DC1606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xK6VcZKH;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=L/EdvEU2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=er2wyZMzOFaLxOz66WprXTP/dKE67/8xYU6EObMHs/U=; b=xK6VcZKH9YEySy
	UJQgwqLjs8tJEIKOGtTv9/FqznJ7hkcvl8tM+mq8kdcD5B1iS4+/xJE12uIb9LLCgEXj7yWCivwSZ
	pTrvDVz8MOt2eZBdGoj3G1skSfItoPyAg7bRUBbvcD5rrHyUPh9cOabjlKYlIsa9dXa2+4xzklFcg
	QztCnOyrFz+slQI0x9hUdxBLA/5Bm5TgWohM489eVdtTZ/gHBzA/WpG02s0Igp7rSpUIo7Ym7Qc5B
	+k8gFJu6CBaB0U+Ij29udPqkV6peKXx6XME1ajRxJ0N/TeMCE+ax93jAsDqg3uxo4RBPfWoLHcAxu
	/+3eCUxt7dVG+fhrN1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU47K-0000000CTEF-3RFi;
	Thu, 19 Nov 2026 15:32:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU47H-0000000CTCK-1cpq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:32:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so25052025e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 07:32:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795102321; cv=none;
        d=google.com; s=arc-20260327;
        b=brybwEH5g2hIZ9gARgdW0IKn55f+XqiT1GOkL1KcqRmlw7VBgOBRtXih8nD7NG012U
         PIcqKtmiOyWbxDUboIkWlBe3cZjwaBMWicTRsVG5kJxKIIxYtrRNN2QiDlE3+tXhtqU2
         m0/ChGeiZBraqZGFI/+MLTiqYOrZ2hp7o1A6uRFvsWYb2+waYL/Jn/apRHJQ8LvAH1go
         eo7wOd750dQuZG/9cReAyY2ZYox7Vz2jhbtQuefg2Bfm3/Vwk1SMQiwBqK5J/egBA440
         EaFEMEuqXKKsam9a02CglT5gQfCwriVYypBzGYUdbHWPaLgsyX9iWv+efnQeDBc8p+Lr
         I4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=er2wyZMzOFaLxOz66WprXTP/dKE67/8xYU6EObMHs/U=;
        fh=eM0MbOzVhzoEu3EUEf2uqIk8zqO8jy9ZN7bKNKbtlkY=;
        b=Jusv7PHV2oK1DmkFsw49BIu5jxDX/+ioSvp48z8TYJoTLX9LiD8NP04UiMPHNw2Sm6
         poO9hMlGXFaxJcxhw2ic0PJoAilI4r81OdWJMOF9tj+mU0F+5Zlw/0OeJMlSIJMeQ+h7
         YbzN03sLGHaw+EuLiike22yVhEBHXjgwazU0yaPQOfxCXR40ufzKO7VNsk/2xsE50+HU
         oWPzORTOANY9I1YcYvXBbwbkJ5wYydGSsIoHSYMPZp/5MgzKq/kM7U4CpzU6XuV1Q2oI
         4hsrKXIVnyY9qtGZFmok2OACdo38gQP9HHCdHAaPc+49bfT2lqhZBia+AQ1Lwr4hFwZW
         aRpg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795102321; x=1795707121; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=er2wyZMzOFaLxOz66WprXTP/dKE67/8xYU6EObMHs/U=;
        b=L/EdvEU2hj6WIVag9+weuUyn8Ii5A207Z70SMP/D5qQuhzrcB+cFmwnBWQdOZwO9ME
         gR/dXI6t+NNZGwebHVzC9iSnbUpIB7FmWHSv6NaLKFvVcHEORHH/mRSAr5oKFUl1xsFY
         TkX3Fe0g+zSgsL0WR0Wx8cX1gVBV2FPd3wsnDx1GNHVkzAvp2R7BX1LcDkmmws5MVrhN
         VWAt0gh4S6HoYmIp5O1wMXGVQ4C1pHwjqof6BhJibo6qUPzjR2F6aR6vF4AvxSHCtyZR
         tglhMyTJGFR05VBBI4g59d4Xtw3sSiAvMFX9rUZ+yXc00Q8xnHsZb4PdeaS0JKkif3aL
         ZdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102321; x=1795707121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=er2wyZMzOFaLxOz66WprXTP/dKE67/8xYU6EObMHs/U=;
        b=ky977F07AeuZ0qKfmOa+rL+AgCFwh6ahqa1Z0NBVTS+YzJscVgSWWQMct7N+E8FiZQ
         XVWvVB2s+bHOp6a5t70jwePbMV1SPeJY8A1owvv+2oqQCAx9dP7+U1DeNC3f6S/amZsb
         1CJUqr5wnZYJuh7dbFwkrU7QaLYaN3Oce4I0DWmbjcqppPfUrXEUNHKmM55GyjREr4ub
         fawPK4RztKgeFPrcK+sCSJWJi10OOrNhBXJjS6jwRU2IfYBDYLWMlO4au5MwY+5tf76O
         zuBrRUJCBCWd3DEimTuXR1JmNd7v1SnvM3feUpGORnxhOfY+Xecbqde3tHXo9tGDpYPB
         GqiQ==
X-Forwarded-Encrypted: i=1; AL+hErHZ+hxc/ZmR6s/fXh8d4i83bmM/N3rok310xxdnsaFV5+OCWwiz1DETc5fVeAG6KT9EC/B5Oin0N+xy36b3AbMR@lists.infradead.org
X-Gm-Message-State: APuU4Z/EROI+A/sdzi3PdDEm83AHHFn238ABDnElFjj5Oof0sUP1Odfx
	C/WjC0sh2j8S3zri4ucVWGKfzV7qEREZhlMRzgwGlZB7XTGPXRTgHu+/lpUs/On3sCwfyA88ilM
	qrryGjW6fNpIGP8Q7BWfsTPixHAWPYzvu70Psc4qHgw==
X-Gm-Gg: AYBFou2qKn4Q7RyJMahG9r4pwjNrJp4xCsetGlZ7OEoJylv2WBkRPHdy8YECfbptZbX
	h/9RQjOgk8+TQbbac7WpZHdK5j10Px0qs0qIf/oxDvZ2UGd1EbMl7WDnR7l9qC9CBAvSNod5AFS
	kJH1dfG0yPjuA+0CJzFUkYAA+0JffN1xslNG7MizCgyCc6bppayJ074854uYRo1/oHztOjBsu2b
	be3mccTfFMtBWxbOGzwghTahuCKxguIeNRIvtBYY+NqHI3p1tz3YeUYisEXWzikEpuDz5q9qA5f
	uw9k4tAz1z4YV3CW7U5pwOKxxrUWjjgecyIUKGslIoBhwOfwDFQW3GldTxbWrsf38yEF8Ez06/B
	XggAhh6+eJX1Q/r6VGdMVoeZvyGscXn/eiffu2VU0z8IzMtL3VX9FcefHfAhZEnjt7mQtt2VEXO
	r9hq8OEisMw858bqxyIbIywm3BbYZ7Xersr7hAp+UqUnTFYfBzQjhslv8=
X-Received: by 2002:a05:600c:a41:b0:4a1:fbd2:f689 with SMTP id
 5b1f17b1804b1-4bb7da13ad8mr128354375e9.7.1795102320876; Thu, 19 Nov 2026
 07:32:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-6-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-6-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 21:01:49 +0530
X-Gm-Features: Aa3M54oS26G2NIQD3dF-_jDrsko_tT7KRUxDV_5uV3qItVR5SQIMYkCSFwe36X0
Message-ID: <CAAhSdy0dzCbZ+5Pr1FOj3Cz=+xNjfuOgr1CX8yyvVHe4vFHymQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/7] riscv: pmu: Add driver for Control Transfer
 Records Ext
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
X-CRM114-CacheID: sfid-20261119_073203_837855_C15B6E42 
X-CRM114-Status: GOOD (  32.17  )
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
> This adds support for CTR Ext defined in [0]. The extension
> allows to records a maximum for 256 last branch records.
>
> CTR extension depends on s[m|s]csrind and Sscofpmf extensions.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-6-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  MAINTAINERS                    |   3 +
>  drivers/perf/Kconfig           |  16 +
>  drivers/perf/Makefile          |   1 +
>  drivers/perf/riscv_ctr.c       | 609 +++++++++++++++++++++++++++++++++
>  include/linux/perf/riscv_pmu.h |  44 ++-
>  5 files changed, 669 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/perf/riscv_ctr.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccbcdc0799b9..87bba12adc7f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24225,8 +24225,11 @@ F:     arch/riscv/boot/dts/sifive/
>  RISC-V PMU DRIVERS
>  M:     Atish Patra <atish.patra@linux.dev>
>  R:     Anup Patel <anup@brainfault.org>
> +R:     Vikram Singh <vikram.singh3@oss.qualcomm.com>
>  L:     linux-riscv@lists.infradead.org
>  S:     Supported
> +F:     Documentation/arch/riscv/pmu-sse.rst

Drop this line since it will be added by the SSE patch series.

> +F:     drivers/perf/riscv_ctr.c
>  F:     drivers/perf/riscv_pmu.c
>  F:     drivers/perf/riscv_pmu_legacy.c
>  F:     drivers/perf/riscv_pmu_sbi.c
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 245e7bb763b9..0b4c04c50c22 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -129,6 +129,22 @@ config ANDES_CUSTOM_PMU
>
>           If you don't know what to do here, say "Y".
>
> +config RISCV_CTR
> +       bool "Enable support for Control Transfer Records (CTR)"
> +       depends on PERF_EVENTS && RISCV_PMU
> +       default y
> +       help
> +         Enable support for Control Transfer Records (CTR) which
> +         allows recording branches, Jumps, Calls, returns etc taken in a=
n
> +         execution path. This also supports privilege based filtering. I=
t
> +         captures additional relevant information such as cycle count,
> +         branch misprediction etc.
> +
> +config RISCV_M_MODE
> +               bool "Enable M Mode"
> +               depends on RISCV_CTR
> +               default n
> +

Drop this "config RISCV_M_MODE" because it is already
defined under arch/riscv

>  config ARM_PMU_ACPI
>         depends on ARM_PMU && ACPI
>         def_bool y
> diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
> index eb8a022dad9a..02cba90afb54 100644
> --- a/drivers/perf/Makefile
> +++ b/drivers/perf/Makefile
> @@ -21,6 +21,7 @@ obj-$(CONFIG_RISCV_PMU) +=3D riscv_pmu.o
>  obj-$(CONFIG_RISCV_PMU_LEGACY) +=3D riscv_pmu_legacy.o
>  obj-$(CONFIG_RISCV_PMU_SBI) +=3D riscv_pmu_sbi.o
>  obj-$(CONFIG_STARFIVE_STARLINK_PMU) +=3D starfive_starlink_pmu.o
> +obj-$(CONFIG_RISCV_CTR) +=3D riscv_ctr.o

Add this line right after the line appending "riscv_pmu_sbi.o"

>  obj-$(CONFIG_THUNDERX2_PMU) +=3D thunderx2_pmu.o
>  obj-$(CONFIG_XGENE_PMU) +=3D xgene_pmu.o
>  obj-$(CONFIG_ARM_SPE_PMU) +=3D arm_spe_pmu.o
> diff --git a/drivers/perf/riscv_ctr.c b/drivers/perf/riscv_ctr.c
> new file mode 100644
> index 000000000000..1af8a304dd69
> --- /dev/null
> +++ b/drivers/perf/riscv_ctr.c
> @@ -0,0 +1,609 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Control transfer records extension Helpers.
> + *
> + * Copyright (C) 2024 Rivos Inc.
> + *
> + * Author: Rajnesh Kanwal <rkanwal@rivosinc.com>

No need to mention author names over here and
all other patches.

> + */
> +
> +#define pr_fmt(fmt) "CTR: " fmt
> +
> +#include <linux/bitfield.h>
> +#include <linux/printk.h>
> +#include <linux/types.h>
> +#include <linux/perf_event.h>
> +#include <linux/perf/riscv_pmu.h>
> +#include <linux/cpufeature.h>
> +#include <asm/hwcap.h>
> +#include <asm/csr_indirect.h>
> +#include <asm/csr.h>
> +
> +#define CTR_BRANCH_FILTERS_INH  (CTRCTL_EXCINH       | \
> +                                CTRCTL_INTRINH      | \
> +                                CTRCTL_TRETINH      | \
> +                                CTRCTL_TKBRINH      | \
> +                                CTRCTL_INDCALL_INH  | \
> +                                CTRCTL_DIRCALL_INH  | \
> +                                CTRCTL_INDJUMP_INH  | \
> +                                CTRCTL_DIRJUMP_INH  | \
> +                                CTRCTL_CORSWAP_INH  | \
> +                                CTRCTL_RET_INH      | \
> +                                CTRCTL_INDOJUMP_INH | \
> +                                CTRCTL_DIROJUMP_INH)
> +
> +#define CTR_BRANCH_ENABLE_BITS (CTRCTL_KERNEL_ENABLE | CTRCTL_U_ENABLE)
> +
> +/* Branch filters not-supported by CTR extension. */
> +#define CTR_EXCLUDE_BRANCH_FILTERS (PERF_SAMPLE_BRANCH_ABORT_TX         =
       | \
> +                                   PERF_SAMPLE_BRANCH_IN_TX            |=
 \
> +                                   PERF_SAMPLE_BRANCH_PRIV_SAVE        |=
 \
> +                                   PERF_SAMPLE_BRANCH_NO_TX            |=
 \
> +                                   PERF_SAMPLE_BRANCH_COUNTERS)
> +
> +/* Branch filters supported by CTR extension. */
> +#define CTR_ALLOWED_BRANCH_FILTERS (PERF_SAMPLE_BRANCH_USER            |=
 \
> +                                   PERF_SAMPLE_BRANCH_KERNEL           |=
 \
> +                                   PERF_SAMPLE_BRANCH_HV               |=
 \
> +                                   PERF_SAMPLE_BRANCH_ANY              |=
 \
> +                                   PERF_SAMPLE_BRANCH_ANY_CALL         |=
 \
> +                                   PERF_SAMPLE_BRANCH_ANY_RETURN       |=
 \
> +                                   PERF_SAMPLE_BRANCH_IND_CALL         |=
 \
> +                                   PERF_SAMPLE_BRANCH_COND             |=
 \
> +                                   PERF_SAMPLE_BRANCH_IND_JUMP         |=
 \
> +                                   PERF_SAMPLE_BRANCH_HW_INDEX         |=
 \
> +                                   PERF_SAMPLE_BRANCH_NO_FLAGS         |=
 \
> +                                   PERF_SAMPLE_BRANCH_NO_CYCLES        |=
 \
> +                                   PERF_SAMPLE_BRANCH_CALL_STACK       |=
 \
> +                                   PERF_SAMPLE_BRANCH_CALL             |=
 \
> +                                   PERF_SAMPLE_BRANCH_TYPE_SAVE)
> +
> +#define CTR_PERF_BRANCH_FILTERS    (CTR_ALLOWED_BRANCH_FILTERS         |=
 \
> +                                   CTR_EXCLUDE_BRANCH_FILTERS)
> +
> +static u64 allowed_filters __read_mostly;
> +
> +struct ctr_regset {
> +       unsigned long src;
> +       unsigned long target;
> +       unsigned long ctr_data;
> +};
> +
> +enum {
> +       CTR_STATE_NONE,
> +       CTR_STATE_VALID,
> +};
> +
> +/* Head is the idx of the next available slot. The slot may be already p=
opulated
> + * by an old entry which will be lost on new writes.
> + */
> +struct riscv_perf_task_context {
> +       int callstack_users;
> +       int stack_state;
> +       unsigned int num_entries;
> +       u32 ctr_status;
> +       u64 ctr_control;
> +       struct ctr_regset store[MAX_BRANCH_RECORDS];
> +};
> +
> +static inline u64 get_ctr_src_reg(unsigned int ctr_idx)
> +{
> +       return csr_indirect_read(CSR_SIREG, CTR_ENTRIES_FIRST, ctr_idx);
> +}
> +
> +static inline void set_ctr_src_reg(unsigned int ctr_idx, u64 value)
> +{
> +       return csr_indirect_write(CSR_SIREG, CTR_ENTRIES_FIRST, ctr_idx, =
value);
> +}
> +
> +static inline u64 get_ctr_tgt_reg(unsigned int ctr_idx)
> +{
> +       return csr_indirect_read(CSR_SIREG2, CTR_ENTRIES_FIRST, ctr_idx);
> +}
> +
> +static inline void set_ctr_tgt_reg(unsigned int ctr_idx, u64 value)
> +{
> +       return csr_indirect_write(CSR_SIREG2, CTR_ENTRIES_FIRST, ctr_idx,=
 value);
> +}
> +
> +static inline u64 get_ctr_data_reg(unsigned int ctr_idx)
> +{
> +       return csr_indirect_read(CSR_SIREG3, CTR_ENTRIES_FIRST, ctr_idx);
> +}
> +
> +static inline void set_ctr_data_reg(unsigned int ctr_idx, u64 value)
> +{
> +       return csr_indirect_write(CSR_SIREG3, CTR_ENTRIES_FIRST, ctr_idx,=
 value);
> +}
> +
> +static inline bool ctr_record_valid(u64 ctr_src)
> +{
> +       return !!FIELD_GET(CTRSOURCE_VALID, ctr_src);
> +}
> +
> +static inline int ctr_get_mispredict(u64 ctr_target)
> +{
> +       return FIELD_GET(CTRTARGET_MISP, ctr_target);
> +}
> +
> +static inline unsigned int ctr_get_cycles(u64 ctr_data)
> +{
> +       const unsigned int cce =3D FIELD_GET(CTRDATA_CCE_MASK, ctr_data);
> +       const unsigned int ccm =3D FIELD_GET(CTRDATA_CCM_MASK, ctr_data);
> +
> +       if (ctr_data & CTRDATA_CCV)
> +               return 0;
> +
> +       /* Formula to calculate cycles from spec: (2^12 + CCM) << CCE-1 *=
/
> +       if (cce > 0)
> +               return (4096 + ccm) << (cce - 1);
> +
> +       return FIELD_GET(CTRDATA_CCM_MASK, ctr_data);
> +}
> +
> +static inline unsigned int ctr_get_type(u64 ctr_data)
> +{
> +       return FIELD_GET(CTRDATA_TYPE_MASK, ctr_data);
> +}
> +
> +static inline unsigned int ctr_get_depth(u64 ctr_depth)
> +{
> +       /* Depth table from CTR Spec: 2.4 sctrdepth.
> +        *
> +        * sctrdepth.depth       Depth
> +        * 000                  - 16
> +        * 001                  - 32
> +        * 010                  - 64
> +        * 011                  - 128
> +        * 100                  - 256
> +        *
> +        * Depth =3D 16 * 2 ^ (ctrdepth.depth)
> +        * or
> +        * Depth =3D 16 << ctrdepth.depth.
> +        */
> +       return 16 << FIELD_GET(SCTRDEPTH_MASK, ctr_depth);
> +}
> +
> +static inline struct riscv_perf_task_context *task_context(void *ctx)
> +{
> +       return (struct riscv_perf_task_context *)ctx;
> +}
> +
> +/* Reads CTR entry at idx and stores it in entry struct. */
> +static bool get_ctr_regset(struct ctr_regset *entry, unsigned int idx)
> +{
> +       entry->src =3D get_ctr_src_reg(idx);
> +
> +       if (!ctr_record_valid(entry->src))
> +               return false;
> +
> +       entry->src =3D entry->src;
> +       entry->target =3D get_ctr_tgt_reg(idx);
> +       entry->ctr_data =3D get_ctr_data_reg(idx);
> +
> +       return true;
> +}
> +
> +static void set_ctr_regset(struct ctr_regset *entry, unsigned int idx)
> +{
> +       set_ctr_src_reg(idx, entry->src);
> +       set_ctr_tgt_reg(idx, entry->target);
> +       set_ctr_data_reg(idx, entry->ctr_data);
> +}
> +
> +static u64 branch_type_to_ctr(int branch_type)
> +{
> +       u64 config =3D CTR_BRANCH_FILTERS_INH | CTRCTL_LCOFIFRZ;
> +
> +       if (branch_type & PERF_SAMPLE_BRANCH_USER)
> +               config |=3D CTRCTL_U_ENABLE;
> +
> +       if (branch_type & PERF_SAMPLE_BRANCH_KERNEL)
> +               config |=3D CTRCTL_KERNEL_ENABLE;
> +
> +       if (branch_type & PERF_SAMPLE_BRANCH_HV) {
> +               if (riscv_isa_extension_available(NULL, H))
> +                       config |=3D CTRCTL_KERNEL_ENABLE;
> +       }
> +
> +       if (branch_type & PERF_SAMPLE_BRANCH_ANY) {
> +               config &=3D ~CTR_BRANCH_FILTERS_INH;
> +               return config;
> +       }
> +
> +       if (branch_type & PERF_SAMPLE_BRANCH_ANY_CALL) {
> +               config &=3D ~CTRCTL_INDCALL_INH;
> +               config &=3D ~CTRCTL_DIRCALL_INH;
> +               config &=3D ~CTRCTL_EXCINH;
> +               config &=3D ~CTRCTL_INTRINH;
> +       }
> +
> +       if (branch_type & PERF_SAMPLE_BRANCH_ANY_RETURN)
> +               config &=3D ~(CTRCTL_RET_INH | CTRCTL_TRETINH);
> +
> +       if (branch_type & PERF_SAMPLE_BRANCH_IND_CALL)
> +               config &=3D ~CTRCTL_INDCALL_INH;
> +
> +       if (branch_type & PERF_SAMPLE_BRANCH_COND)
> +               config &=3D ~CTRCTL_TKBRINH;
> +
> +       if (branch_type & PERF_SAMPLE_BRANCH_CALL_STACK)
> +               config |=3D CTRCTL_RASEMU;
> +
> +       if (branch_type & PERF_SAMPLE_BRANCH_IND_JUMP) {
> +               config &=3D ~CTRCTL_INDJUMP_INH;
> +               config &=3D ~CTRCTL_INDOJUMP_INH;
> +       }
> +
> +       if (branch_type & PERF_SAMPLE_BRANCH_CALL)
> +               config &=3D ~CTRCTL_DIRCALL_INH;
> +
> +       return config;
> +}
> +
> +static const int ctr_perf_map[] =3D {
> +       [CTRDATA_TYPE_NONE]                     =3D PERF_BR_UNKNOWN,
> +       [CTRDATA_TYPE_EXCEPTION]                =3D PERF_BR_SYSCALL,
> +       [CTRDATA_TYPE_INTERRUPT]                =3D PERF_BR_IRQ,
> +       [CTRDATA_TYPE_TRAP_RET]                 =3D PERF_BR_ERET,
> +       [CTRDATA_TYPE_NONTAKEN_BRANCH]          =3D PERF_BR_COND,
> +       [CTRDATA_TYPE_TAKEN_BRANCH]             =3D PERF_BR_COND,
> +       [CTRDATA_TYPE_RESERVED_6]               =3D PERF_BR_UNKNOWN,
> +       [CTRDATA_TYPE_RESERVED_7]               =3D PERF_BR_UNKNOWN,
> +       [CTRDATA_TYPE_INDIRECT_CALL]            =3D PERF_BR_IND_CALL,
> +       [CTRDATA_TYPE_DIRECT_CALL]              =3D PERF_BR_CALL,
> +       [CTRDATA_TYPE_INDIRECT_JUMP]            =3D PERF_BR_IND,
> +       [CTRDATA_TYPE_DIRECT_JUMP]              =3D PERF_BR_UNCOND,
> +       [CTRDATA_TYPE_CO_ROUTINE_SWAP]          =3D PERF_BR_UNKNOWN,
> +       [CTRDATA_TYPE_RETURN]                   =3D PERF_BR_RET,
> +       [CTRDATA_TYPE_OTHER_INDIRECT_JUMP]      =3D PERF_BR_IND,
> +       [CTRDATA_TYPE_OTHER_DIRECT_JUMP]        =3D PERF_BR_UNCOND,
> +};
> +
> +static void ctr_set_perf_entry_type(struct perf_branch_entry *entry,
> +                                   u64 ctr_data)
> +{
> +       int ctr_type =3D ctr_get_type(ctr_data);
> +
> +       entry->type =3D ctr_perf_map[ctr_type];
> +       if (entry->type =3D=3D PERF_BR_UNKNOWN)
> +               pr_warn("%d - unknown branch type captured\n", ctr_type);
> +}
> +
> +static void capture_ctr_flags(struct perf_branch_entry *entry,
> +                             struct perf_event *event, u64 ctr_data,
> +                             u64 ctr_target)
> +{
> +       if (branch_sample_type(event))
> +               ctr_set_perf_entry_type(entry, ctr_data);
> +
> +       if (!branch_sample_no_cycles(event))
> +               entry->cycles =3D ctr_get_cycles(ctr_data);
> +
> +       if (!branch_sample_no_flags(event)) {
> +               entry->abort =3D 0;
> +               entry->mispred =3D ctr_get_mispredict(ctr_target);
> +               entry->predicted =3D !entry->mispred;
> +       }
> +
> +       if (branch_sample_priv(event))
> +               entry->priv =3D PERF_BR_PRIV_UNKNOWN;
> +}
> +
> +static void ctr_regset_to_branch_entry(struct cpu_hw_events *cpuc,
> +                                      struct perf_event *event,
> +                                      struct ctr_regset *regset,
> +                                      unsigned int idx)
> +{
> +       struct perf_branch_entry *entry =3D &cpuc->branches->branch_entri=
es[idx];
> +
> +       *entry =3D (struct perf_branch_entry){ };
> +       entry->from =3D regset->src & (~CTRSOURCE_VALID);
> +       entry->to =3D regset->target & (~CTRTARGET_MISP);
> +       capture_ctr_flags(entry, event, regset->ctr_data, regset->target)=
;
> +}
> +
> +static void ctr_read_entries(struct cpu_hw_events *cpuc,
> +                            struct perf_event *event,
> +                            unsigned int depth)
> +{
> +       struct ctr_regset entry =3D {};
> +       u64 ctr_ctl;
> +       int i;
> +
> +       ctr_ctl =3D csr_read_clear(CSR_CTRCTL, CTR_BRANCH_ENABLE_BITS);
> +
> +       for (i =3D 0; i < depth; i++) {
> +               if (!get_ctr_regset(&entry, i))
> +                       break;
> +
> +               ctr_regset_to_branch_entry(cpuc, event, &entry, i);
> +       }
> +
> +       csr_set(CSR_CTRCTL, ctr_ctl & CTR_BRANCH_ENABLE_BITS);
> +
> +       cpuc->branches->branch_stack.nr =3D i;
> +       cpuc->branches->branch_stack.hw_idx =3D 0;
> +}
> +
> +bool riscv_pmu_ctr_valid(struct perf_event *event)
> +{
> +       u64 branch_type =3D event->attr.branch_sample_type;
> +
> +       if (branch_type & ~allowed_filters) {
> +               pr_debug_once("Requested branch filters not supported 0x%=
llx\n",
> +                             branch_type & ~allowed_filters);
> +               return false;
> +       }
> +
> +       return true;
> +}
> +
> +void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc, struct perf_event=
 *event)
> +{
> +       unsigned int depth =3D to_riscv_pmu(event->pmu)->ctr_depth;
> +
> +       ctr_read_entries(cpuc, event, depth);
> +
> +       /* Clear frozen bit. */
> +       csr_clear(CSR_SCTRSTATUS, SCTRSTATUS_FROZEN);
> +}
> +
> +static void riscv_pmu_ctr_reset(void)
> +{
> +       /* FIXME: Replace with sctrclr instruction once support is merged
> +        * into toolchain.
> +        */
> +       asm volatile(".4byte 0x10400073\n" ::: "memory");
> +       csr_write(CSR_SCTRSTATUS, 0);
> +}
> +
> +static void __riscv_pmu_ctr_restore(void *ctx)
> +{
> +       struct riscv_perf_task_context *task_ctx =3D ctx;
> +       unsigned int i;
> +
> +       csr_write(CSR_SCTRSTATUS, task_ctx->ctr_status);
> +
> +       for (i =3D 0; i < task_ctx->num_entries; i++)
> +               set_ctr_regset(&task_ctx->store[i], i);
> +}
> +
> +static void riscv_pmu_ctr_restore(void *ctx)
> +{
> +       if (task_context(ctx)->stack_state =3D=3D CTR_STATE_NONE ||
> +           task_context(ctx)->callstack_users =3D=3D 0) {
> +               return;
> +       }
> +
> +       riscv_pmu_ctr_reset();
> +       __riscv_pmu_ctr_restore(ctx);
> +
> +       task_context(ctx)->stack_state =3D CTR_STATE_NONE;
> +}
> +
> +static void __riscv_pmu_ctr_save(void *ctx, unsigned int depth)
> +{
> +       struct riscv_perf_task_context *task_ctx =3D ctx;
> +       struct ctr_regset *dst;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < depth; i++) {
> +               dst =3D &task_ctx->store[i];
> +               if (!get_ctr_regset(dst, i))
> +                       break;
> +       }
> +
> +       task_ctx->num_entries =3D i;
> +
> +       task_ctx->ctr_status =3D csr_read(CSR_SCTRSTATUS);
> +}
> +
> +static void riscv_pmu_ctr_save(void *ctx, unsigned int depth)
> +{
> +       if (task_context(ctx)->stack_state =3D=3D CTR_STATE_VALID)
> +               return;
> +
> +       if (task_context(ctx)->callstack_users =3D=3D 0) {
> +               task_context(ctx)->stack_state =3D CTR_STATE_NONE;
> +               return;
> +       }
> +
> +       __riscv_pmu_ctr_save(ctx, depth);
> +
> +       task_context(ctx)->stack_state =3D CTR_STATE_VALID;
> +}
> +
> +/*
> + * On context switch in, we need to make sure no samples from previous t=
asks
> + * are left in the CTR.
> + *
> + * On ctxswin, sched_in =3D true, called after the PMU has started
> + * On ctxswout, sched_in =3D false, called before the PMU is stopped
> + */
> +void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *pmu_ctx, st=
ruct task_struct *task,
> +                             bool sched_in)
> +{
> +       struct riscv_pmu *rvpmu =3D to_riscv_pmu(pmu_ctx->pmu);
> +       struct cpu_hw_events *cpuc =3D this_cpu_ptr(rvpmu->hw_events);
> +       void *task_ctx;
> +
> +       if (!cpuc->ctr_users)
> +               return;
> +
> +       /* Save branch records in task_ctx on sched out */
> +       task_ctx =3D pmu_ctx ? task->perf_ctx_data : NULL;
> +       if (task_ctx) {
> +               if (sched_in)
> +                       riscv_pmu_ctr_restore(task_ctx);
> +               else
> +                       riscv_pmu_ctr_save(task_ctx, rvpmu->ctr_depth);
> +               return;
> +       }
> +
> +       /* Reset branch records on sched in */
> +       if (sched_in)
> +               riscv_pmu_ctr_reset();
> +}
> +
> +static inline bool branch_user_callstack(unsigned int br_type)
> +{
> +       return (br_type & PERF_SAMPLE_BRANCH_USER) &&
> +               (br_type & PERF_SAMPLE_BRANCH_CALL_STACK);
> +}
> +
> +void riscv_pmu_ctr_add(struct perf_event *event)
> +{
> +       struct riscv_pmu *rvpmu =3D to_riscv_pmu(event->pmu);
> +       struct cpu_hw_events *cpuc =3D this_cpu_ptr(rvpmu->hw_events);
> +
> +       if (branch_user_callstack(event->attr.branch_sample_type) &&
> +           event->ctx->task->perf_ctx_data)
> +               task_context(event->ctx->task->perf_ctx_data)->callstack_=
users++;
> +
> +       perf_sched_cb_inc(event->pmu);
> +
> +       if (!cpuc->ctr_users++)
> +               riscv_pmu_ctr_reset();
> +}
> +
> +void riscv_pmu_ctr_del(struct perf_event *event)
> +{
> +       struct riscv_pmu *rvpmu =3D to_riscv_pmu(event->pmu);
> +       struct cpu_hw_events *cpuc =3D this_cpu_ptr(rvpmu->hw_events);
> +
> +       if (branch_user_callstack(event->attr.branch_sample_type) &&
> +           event->ctx->task->perf_ctx_data)
> +               task_context(event->ctx->task->perf_ctx_data)->callstack_=
users--;
> +
> +       perf_sched_cb_dec(event->pmu);
> +       cpuc->ctr_users--;
> +       WARN_ON_ONCE(cpuc->ctr_users < 0);
> +}
> +
> +void riscv_pmu_ctr_enable(struct perf_event *event)
> +{
> +       u64 branch_type =3D event->attr.branch_sample_type;
> +       u64 ctr;
> +
> +       ctr =3D branch_type_to_ctr(branch_type);
> +       csr_write(CSR_CTRCTL, ctr);
> +}
> +
> +void riscv_pmu_ctr_disable(struct perf_event *event)
> +{
> +       /* Clear CTRCTL to disable the recording. */
> +       csr_write(CSR_CTRCTL, 0);
> +}
> +
> +/*
> + * Check for hardware supported perf filters here. To avoid missing
> + * any new added filter in perf, we do a BUILD_BUG_ON check, so make sur=
e
> + * to update CTR_ALLOWED_BRANCH_FILTERS or CTR_EXCLUDE_BRANCH_FILTERS
> + * defines when adding support for it in below function.
> + */
> +static void __init check_available_filters(void)
> +{
> +       u64 ctr_ctl;
> +
> +       /*
> +        * Ensure both perf branch filter allowed and exclude
> +        * masks are always in sync with the generic perf ABI.
> +        */
> +       BUILD_BUG_ON(CTR_PERF_BRANCH_FILTERS !=3D (PERF_SAMPLE_BRANCH_MAX=
 - 1));
> +
> +       allowed_filters =3D PERF_SAMPLE_BRANCH_USER      |
> +                         PERF_SAMPLE_BRANCH_KERNEL    |
> +                         PERF_SAMPLE_BRANCH_ANY       |
> +                         PERF_SAMPLE_BRANCH_HW_INDEX  |
> +                         PERF_SAMPLE_BRANCH_NO_FLAGS  |
> +                         PERF_SAMPLE_BRANCH_NO_CYCLES |
> +                         PERF_SAMPLE_BRANCH_TYPE_SAVE;
> +
> +       csr_write(CSR_CTRCTL, ~0);
> +       ctr_ctl =3D csr_read(CSR_CTRCTL);
> +       csr_write(CSR_CTRCTL, 0);
> +
> +       if (riscv_isa_extension_available(NULL, H))
> +               allowed_filters |=3D PERF_SAMPLE_BRANCH_HV;
> +
> +       if (ctr_ctl & (CTRCTL_INDCALL_INH | CTRCTL_DIRCALL_INH))
> +               allowed_filters |=3D PERF_SAMPLE_BRANCH_ANY_CALL;
> +
> +       if (ctr_ctl & (CTRCTL_RET_INH | CTRCTL_TRETINH))
> +               allowed_filters |=3D PERF_SAMPLE_BRANCH_ANY_RETURN;
> +
> +       if (ctr_ctl & CTRCTL_INDCALL_INH)
> +               allowed_filters |=3D PERF_SAMPLE_BRANCH_IND_CALL;
> +
> +       if (ctr_ctl & CTRCTL_TKBRINH)
> +               allowed_filters |=3D PERF_SAMPLE_BRANCH_COND;
> +
> +       if (ctr_ctl & CTRCTL_RASEMU)
> +               allowed_filters |=3D PERF_SAMPLE_BRANCH_CALL_STACK;
> +
> +       if (ctr_ctl & (CTRCTL_INDOJUMP_INH | CTRCTL_INDJUMP_INH))
> +               allowed_filters |=3D PERF_SAMPLE_BRANCH_IND_JUMP;
> +
> +       if (ctr_ctl & CTRCTL_DIRCALL_INH)
> +               allowed_filters |=3D PERF_SAMPLE_BRANCH_CALL;
> +}
> +
> +void riscv_pmu_ctr_starting_cpu(void)
> +{
> +       if (!riscv_isa_extension_available(NULL, SxCTR) ||
> +           !riscv_isa_extension_available(NULL, SSCOFPMF))
> +               return;
> +
> +       /* Set depth to maximum. */
> +       csr_write(CSR_SCTRDEPTH, SCTRDEPTH_MASK);
> +}
> +
> +void riscv_pmu_ctr_dying_cpu(void)
> +{
> +       if (!riscv_isa_extension_available(NULL, SxCTR) ||
> +           !riscv_isa_extension_available(NULL, SSCOFPMF))
> +               return;
> +
> +       /* Clear and reset CTR CSRs. */
> +       csr_write(CSR_SCTRDEPTH, 0);
> +       csr_write(CSR_CTRCTL, 0);
> +       riscv_pmu_ctr_reset();
> +}
> +
> +int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu)
> +{
> +       size_t size =3D sizeof(struct riscv_perf_task_context);
> +
> +       if (!riscv_isa_extension_available(NULL, SxCTR) ||
> +           !riscv_isa_extension_available(NULL, SSCOFPMF))
> +               return 0;
> +
> +       riscv_pmu->pmu.task_ctx_cache =3D
> +               kmem_cache_create("ctr_task_ctx", size, sizeof(u64), 0, N=
ULL);
> +       if (!riscv_pmu->pmu.task_ctx_cache)
> +               return -ENOMEM;
> +
> +       check_available_filters();
> +
> +       /* Set depth to maximum. */
> +       csr_write(CSR_SCTRDEPTH, SCTRDEPTH_MASK);
> +       riscv_pmu->ctr_depth =3D ctr_get_depth(csr_read(CSR_SCTRDEPTH));
> +
> +       pr_info("Perf CTR available, with %d depth\n", riscv_pmu->ctr_dep=
th);
> +
> +       return 0;
> +}
> +
> +void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu)
> +{
> +       if (!riscv_pmu_ctr_supported(riscv_pmu))
> +               return;
> +
> +       riscv_pmu->ctr_depth =3D 0;
> +       csr_write(CSR_SCTRDEPTH, 0);
> +       csr_write(CSR_CTRCTL, 0);
> +       riscv_pmu_ctr_reset();
> +
> +       kmem_cache_destroy(riscv_pmu->pmu.task_ctx_cache);
> +}
> diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pm=
u.h
> index c748a06ad751..848977ecf319 100644
> --- a/include/linux/perf/riscv_pmu.h
> +++ b/include/linux/perf/riscv_pmu.h
> @@ -56,9 +56,8 @@ struct cpu_hw_events {
>         bool snapshot_set_done;
>         /* A shadow copy of the counter values to avoid clobbering during=
 multiple SBI calls */
>         u64 snapshot_cval_shcopy[RISCV_MAX_COUNTERS];
> -       /* Saved branch records. */
> +       /* Saved branch records */
>         struct branch_records *branches;
> -
>         /* Active events requesting branch records */
>         int ctr_users;
>  };
> @@ -88,8 +87,7 @@ struct riscv_pmu {
>         struct cpu_hw_events    __percpu *hw_events;
>         struct hlist_node       node;
>         struct notifier_block   riscv_pm_nb;
> -
> -       unsigned int    ctr_depth;
> +       unsigned int ctr_depth;
>  };
>
>  #define to_riscv_pmu(p) (container_of(p, struct riscv_pmu, pmu))
> @@ -111,6 +109,44 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *n=
um_hw_ctr);
>  int riscv_pmu_get_event_info(u32 type, u64 config, u64 *econfig);
>  #endif
>
> +static inline bool riscv_pmu_ctr_supported(struct riscv_pmu *pmu)
> +{
> +       return !!pmu->ctr_depth;
> +}
> +
>  #endif /* CONFIG_RISCV_PMU */
>
> +#ifdef CONFIG_RISCV_CTR
> +
> +bool riscv_pmu_ctr_valid(struct perf_event *event);
> +void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc, struct perf_event=
 *event);
> +void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *pmu_ctx, st=
ruct task_struct *task,
> +                             bool sched_in);
> +void riscv_pmu_ctr_add(struct perf_event *event);
> +void riscv_pmu_ctr_del(struct perf_event *event);
> +void riscv_pmu_ctr_enable(struct perf_event *event);
> +void riscv_pmu_ctr_disable(struct perf_event *event);
> +void riscv_pmu_ctr_dying_cpu(void);
> +void riscv_pmu_ctr_starting_cpu(void);
> +int  riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu);
> +void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu);
> +
> +#else
> +
> +static inline bool riscv_pmu_ctr_valid(struct perf_event *event) { retur=
n false; }
> +static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
> +                                        struct perf_event *event) { }
> +static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_contex=
t *,
> +                                           struct task_struct *task, boo=
l sched_in) { }
> +static void riscv_pmu_ctr_add(struct perf_event *event) { }
> +static void riscv_pmu_ctr_del(struct perf_event *event) { }
> +static inline void riscv_pmu_ctr_enable(struct perf_event *event) { }
> +static inline void riscv_pmu_ctr_disable(struct perf_event *event) { }
> +static inline void riscv_pmu_ctr_dying_cpu(void) { }
> +static inline void riscv_pmu_ctr_starting_cpu(void) { }
> +static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { retu=
rn 0; }
> +static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
> +
> +#endif /* CONFIG_RISCV_CTR */
> +
>  #endif /* _RISCV_PMU_H */
> --
> 2.43.0
>

Regards,
Anup

