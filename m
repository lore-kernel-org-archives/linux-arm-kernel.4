Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C07E606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tSG/j1/t;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=rAbgVpBG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=; b=tSG/j1/tcal9FD
	asZ5V4zBZl+G6yuccqg25ZLHxXEU+PuleCDoRlDu4ElOAPj3KV6y4s5fl/92ngKt0Gt5f6T8JyDJj
	AklArfusAmyQtMa73HxKqAZfFn+PFI0kA7pJiKkEmLb2axyfr2aR2RHeHRtQewV+qXFBHiiZfB7ME
	PrjwKNPeIpa6MjfGaFGsktlz4nICf3ea08ilNeuyJdEUEOYHetCvVxOpkOPUlsgJdBPrDb3VO1P8Y
	W/bBv6GN/0dUDs6/b9RijTivp3BhUIiWsyIYeK2b7Isdedv8TolvAiXmRSahTI1Q6ERhBiD7N8IVC
	G31Db0U6beNkTDu+7zYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3rv-0000000CObX-1jre;
	Thu, 19 Nov 2026 15:16:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3rm-0000000COYi-3XuZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:16:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so13721615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 07:16:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101360; cv=none;
        d=google.com; s=arc-20260327;
        b=UKA3jk2R8ZuE9N8k4Rdt8XfDImdcr/94mA4gRURdcUECiCZOI7wQ4n11vWNHloi/sV
         eLtcSTgSx4KApmNG3SpJxx8dy/MGGs2q91Om996IjAJQiK5oSrY62oqaPfR+vOo5dTH+
         u6rR/STMpLVyVvIELn7s98979Ii7u+il1BESNWzVK1cYRg+bW0KhwCdmNev+ZYq9B076
         biWV6jUUeY5l63BJfFVZ0u2Z2Lcivtcmxp4+SgVUWHYemdCVk9sts6TyQKPvXQGy+HEI
         N638bC0FqZbJqlkaCSBlrSmmlnW25cF6ZnxjjqGODmIEj2tQCar182oRNDz607RiFrri
         LfJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
        fh=/KT5aIQTPlV9FxHaLYlO8QCIADxSjY8Vk+3cIOjRunw=;
        b=H8Ia3wufF+ZXj5cJgWzRyeaVps/zRMkd0Tb9icDmaOGew1g63GzSM8nYDclScBNHr2
         KaXeYXAwnVhqPT9GlA4oyawOSRJL3E3RkRZod/p2X2jkBIjGr2gf8P5T44Qm42w6UWOq
         PpBhfov2inSao//M5L1mbrR68RZRtqVVr05nimb2vNQAWiDLP8TtLWRaRIRss43RHqZG
         fk2R0VrjtUvm/hRmd9449LVAzqu/U91c0oK7eVAY9uSFbSNHa48AOf7s3kFojyB6aXMr
         8voUZ/Jy23anMal25MSQbtIhIiyTAXHTIajTe1xCwK9ogOg7wbV6KhZXsUTha0C07nFC
         ZbbA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795101360; x=1795706160; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
        b=rAbgVpBGUxitNBwdmmcpn+8l8Siqeo0eA9lLYafs+lbXCw7oGCmXHMk+Jx4VIcX1us
         MfLBdfDYuPaMqjkm/GIzfPPTD/UmVeEK4CJz9RlGlRQimF3u35AM/KQHXf4O5MdcdG6A
         9r73qDw0kmVHD/ZAIC+NozrbkaCfE0Ixl68tnb9x5bM5o+m2bKqy0hlOxP71tpqbsUi2
         QeNKRIAFplOIOmkL3MAtPcDpPviFTEjIy0bAfdWkhDhAfEvqRW3s4dIFTJeJkECiwcK5
         Dq1tMIklQuvC8Mo2173DQaa4tqBVOuvvksgxI4wEa0vL8rFkw0+TZ+encYdncD5N98YD
         r/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101360; x=1795706160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYH388mwmO8nek0Ej+CJLpAy9WcejyRXVXCYGDnSrqw=;
        b=YhJCOyZZwQhngmMSFiRsdyYIPRLeqx+JMYuRjrIFM8n3hnoaEdb6/+pf+ZEwwhxbvN
         D2HZHn6zQ3ZNn94keMlsqV/u5W8hFKNeqEubMZ3UCkQBb7e/vVQhUbia2aAyad9UMwsS
         NhQgZ2qCDx5SkdJhySJ4PBkfuFDGUArbat/aRm2Nse6X3UVr1IjuItcff+oYJHHUhqcL
         tb3YMfKYnfOF4WZTHmplYj1pAvi2wjKK/w5lWL25GM26/cFvpE2KDdFgJMpcMHc8OnF7
         tvgsPEz3Sd0p/T5fdhcsZGJ74zQ0Ij2JZhE1WB8Ua+xZ/E1O/cjv/wJAkIMzJ+W7Y0h2
         CfPQ==
X-Forwarded-Encrypted: i=1; AL+hErEwZv9EgruyC+kmj0JQWfvPbaTNZGFfWINvsAmzDMV1EgwEvy5sweJ01oZhcVR2glfUlqQYZA81GbmmvzWWTdEQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8aUHMBGBQ+SrOoM7PJMWerYk0cal8VDih/5giCMn6e8DTeeWHE
	MR9nYDJyiBu5otHs76MlfqnyM1T+YlxwjzgYNQ3hXFJSko1PUTykYo2pKpC6DjhEvyFrpu3EZeU
	opfA4bA4usvK9qTcCOZsQ36wbJ6BOfGFK5bfmWcnIEw==
X-Gm-Gg: AYBFou2sjtsF6Bt8jZsOK+5bqJ0jnTC+4CEborkc4iuKAxPS3+lTVZLmIebNrU5tKZa
	mfi4hGVvAnKo54KMD1UD9KGXLVHsP4tk5SAF5qmjsC+pmRXAOR8QDpWnuNcRC0S5h0J9IEkyBf8
	SRCrLdrRImMFnNdSBdFvXdlTa/710ptYFjgsYE3kFhoJ9r5ej6k/NrwSIhbRWe0g2bdCGPMSOxU
	wUrFcZvESqDcg6N/NfaZEA4M4R5mlouqlGNNmoKgns6oiADvGsdUsze/pOTIG3DeG1k0rvWJ309
	Fb77vPuq/EMZ77AxH1rpq+0bEJ6iyMVO3mqIO6Sn4vDH7X+HC7N8yjEzOxvPI8A6OHo05FjIC8I
	LEnXAb66cX2pyfUdtoqi2QHIEwmdfO/yMLQiIood31MA2Zi97abFbC27CBSXkawY/Ww/NQdwLPq
	toHY7h1hC6G6NbtgoBfAAvI9fzcWO+eIkJzN//tbT7miI3gNbzBeMlYlQnFVy6X0IxlHsL6uvG7
	717
X-Received: by 2002:a05:600c:c106:b0:4bb:87be:c138 with SMTP id
 5b1f17b1804b1-4bb87bec13fmr12856555e9.32.1795101360089; Thu, 19 Nov 2026
 07:16:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-2-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-2-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:45:48 +0530
X-Gm-Features: Aa3M54riNYPYm1hR-WMNehgnqK1cKsrsmx9wlvpLX0ldc8qDneAu48N6AszDino
Message-ID: <CAAhSdy1QdF3rA3bkKsdOe-pPV+JekgUeFB2LOirCTf3L_qjK_Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] perf: Increase the maximum number of branches
 remove_loops() can process.
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
X-CRM114-CacheID: sfid-20261119_071602_939176_90599D40 
X-CRM114-Status: GOOD (  21.30  )
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
> RISCV CTR extension supports a maximum depth of 256 last branch records.
> Currently remove_loops() can only process 127 entries at max. This leads
> to samples with more than 127 entries being skipped. This change simply
> updates the remove_loops() logic to be able to process 256 entries.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-2-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

I think you accidentally picked "Link:" and "Signed-off-by:" myself.
Please drop these lines from all patches.

Typically, the "Link:" and the following "Signed-off-by:" is added by
"b4 am -l -s" options so as a contributor don't use "-l -s" options
when using "b4 am".

> ---
>  tools/perf/util/machine.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/tools/perf/util/machine.c b/tools/perf/util/machine.c
> index 076d167380f2..f1efd1120a95 100644
> --- a/tools/perf/util/machine.c
> +++ b/tools/perf/util/machine.c
> @@ -2334,25 +2334,32 @@ static void save_iterations(struct iterations *it=
er,
>                 iter->cycles +=3D be[i].flags.cycles;
>  }
>
> -#define CHASHSZ 127
> -#define CHASHBITS 7
> -#define NO_ENTRY 0xff
> +#define CHASHBITS 8
> +#define NO_ENTRY 0xffU
>
> -#define PERF_MAX_BRANCH_DEPTH 127
> +#define PERF_MAX_BRANCH_DEPTH 256
>
>  /* Remove loops. */
> +/* Note: Last entry (i=3D=3Dff) will never be checked against NO_ENTRY
> + * so it's safe to have an unsigned char array to process 256 entries
> + * without causing clash between last entry and NO_ENTRY value.
> + */
>  static int remove_loops(struct branch_entry *l, int nr,
>                         struct iterations *iter)
>  {
>         int i, j, off;
> -       unsigned char chash[CHASHSZ];
> +       unsigned char chash[PERF_MAX_BRANCH_DEPTH];
>
>         memset(chash, NO_ENTRY, sizeof(chash));
>
> -       BUG_ON(PERF_MAX_BRANCH_DEPTH > 255);
> +       BUG_ON(PERF_MAX_BRANCH_DEPTH > 256);
>
>         for (i =3D 0; i < nr; i++) {
> -               int h =3D hash_64(l[i].from, CHASHBITS) % CHASHSZ;
> +               /* Remainder division by PERF_MAX_BRANCH_DEPTH is not
> +                * needed as hash_64 will anyway limit the hash
> +                * to CHASHBITS
> +                */
> +               int h =3D hash_64(l[i].from, CHASHBITS);
>
>                 /* no collision handling for now */
>                 if (chash[h] =3D=3D NO_ENTRY) {
> --
> 2.43.0
>

Otherwise, LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

