Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BAA606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wWFbwwbE;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZD7eAmBD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bb6MtTt8fw3gLO1EuXLXH1MyB9ZeehUQm7NFHSQwlcs=; b=wWFbwwbE/wLIUk
	GzI90PxIvD2abZH3ySa+yXzBSpqas+Yt596tM/EM1hZC74S8NhxPyfG9xJCIJLFAK17Bz5nUkhcjc
	oCtflfEcvd5ChlvwB5vAkLhQ0afb+4ksjY1csr33kQtWkYqQNVkMPXq4SV62SSyXsVoE5UKffi+AG
	eV8RnpaiYNXY3NtsXABGWcYl2+fQRb9A3GgkO+YoExpyL62/4aIKu2wGT9N1tc2d/TyRG0XGUEagP
	Ogpv2ePYywiW0U5KcOHoJoemS2LrroWTyvbn1KardXA4sNUW1RdzumOtI4PYzdPpEdEZ8FQ2HK9tj
	OPDU46E/jblhSyyPHchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuBI-0000000DYGK-055L;
	Fri, 13 Nov 2026 16:31:16 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuBF-0000000DYFu-0Rxg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 16:31:14 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-533202fe429so423691cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 08:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587472; cv=none;
        d=google.com; s=arc-20260327;
        b=iJ7RAIFETMLALtYd598jG2Rwm4srgCopQwG7cnxv04IdXe9Zs0+UxaSnO4gMFOjq4N
         FLxHEtY/WZ/mKFGYXRGRP3iY7+BklwG9/TB/NzQZbUvGDoEfr1oOpdjO6AHh/S9XFFCT
         ZIhUrswvE/ksrbvgQeGMSSdyLnm+ZSP+TdprPOa6yDaLGvfbqyQuZ2W0tWFPBBbI5az2
         sOMHmP77XZn33eFM/JVrqQbQMzl33VyVkCcI7qhYS57q6VPpHzLZBqwqyxesxEhhmj+V
         Y6pY/Ipl5xSC75dtfmWzmuLVEYj5B5GF7Wld622eSKH785RaaeeYImPvNwXJ16rKEm40
         J13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bb6MtTt8fw3gLO1EuXLXH1MyB9ZeehUQm7NFHSQwlcs=;
        fh=cdvubUHUd5lyajfyYXM40GlHRvPvONeRyRue1PQeKgU=;
        b=F9aoVLUDBavxiCQP5mo1eW7Bumz1JioDWHKYi6J1vKF6WbmiHiVSXbTJuYHc5nnHuN
         ZLaSG7QVDGiodZ9EFu2B5L3C0BadRzZa3tcdttdHXcTCALlCqkVF31RUzGapE1LTQ/Yk
         6P+3EMklbTEtMVUNiMd9KUFZSW427u1IUZvIHg7+5N3FLUdECUaxPcqc28TvuoY7858I
         mVaM5t2+M0IQtR/R5j4x57VjfigA64Ovwb/rNFCk3z92F/fxlBWQLifZjFP986PuNSHl
         g36HUtQHK7fpchSOMR1pvtIBnQbLv+58xDa918EJ50NkhxjAB7s3xst8+6g461ShbSxb
         2pkQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794587472; x=1795192272; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bb6MtTt8fw3gLO1EuXLXH1MyB9ZeehUQm7NFHSQwlcs=;
        b=ZD7eAmBDs/Q3g7U3W0HOnAZIyaly/e8FE5FxXSybBf66DhlDxFGE3QZfXLGhixb7LF
         W6NqimynsVAKaZ7DIfSAgGOUTa+oitw4lPks9YWZLYALE2CxDK+Kygkil/yzC5Jdj/43
         xKEJsojWfY+pbUziho0d8D6deZslZLkwtc1TppsSllstuLXj0yiInokKgTzdDo1ePb3W
         0hRQB0hnIXkIc40gJmMxmS2UxZAGzGe3KpSOZWTRt3iCwN7sqxOAjfSqlL8o8Z5VNWeO
         3E4ubs2s5PsPCT23VGUNhsUtX27W5FqM8ENXBxAvYyMLXmC0GBawTuGFZcrkp0Ny2bKF
         T4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587472; x=1795192272;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bb6MtTt8fw3gLO1EuXLXH1MyB9ZeehUQm7NFHSQwlcs=;
        b=f0w3Jp9Ba535D4aF8DApxQZhuoO6eW4pmVNNLarSKpZC/nuciCW4BxDTj67Gupb0t1
         k5PEa0ZMG+BT2xQlTdsZ/MhDdRXvA9XBbml/QBAjDlD9zFO4LJX2V+M8d9r0DVoIkq4B
         ezT77Y92znSOzl5QE2/jCvfHds42w8M+ijMRH7CLvtdLtqYLHXBrS+iPN6dTrZ80m9LD
         92hKzoZmO2dSMpQ2/pgTP0H/iJrjKV4nCRklzljTJk04vxsST90jS0DCyufH7Rk/eNlB
         dG6ra2c5ORDU2LGBWUuHn1I0Rtfis2uSJ7YkbGy0wpzYdW8zldiQbDjk0khwIKvok963
         YVyw==
X-Forwarded-Encrypted: i=1; AL+hErHTaCXawDoKg2RW8Q4glDuPpLwPttKzpxCC2yzq7YkvL244LuMSnhfD1y7U87Qr35HMUmPM0TQ4c6HKGLOkiFKP@lists.infradead.org
X-Gm-Message-State: APuU4Z/AihYv2zRHc8HWs4RYHqd6nAHFUJoDfD+/yQAy71OqGLDlnbqJ
	x+td/u10bZAfHDdVNAjLOUiRHOhCmRX9DGC7RUAwcdxSXNl8qdv+AjFvZ3nvB1F+nMpdl6+Hdym
	oE3O+3LYmPTA3oDexajCF/sJvsJFUjLUWD4adE9n/
X-Gm-Gg: AYBFou396g5PH++aoXZdJnMBLvVMNtGXLYboEEgYuHvXc/Vc+J+wFafy5ccyJvpTdiO
	FVk3R3+AKMwIKQ6obPdzGlU2Ud2lgMkWRjTYkjwKCNLQ3O6EdxHrIAJOWxeAk7zQR9vf9dOT0ae
	eVBu6EVIdISxbA9u8uTKM7dMUXsnaU/5XaAuV+SXNAa/SPWKL1TDlB30A6L8gfRG+HqB5F5ot03
	MAyrvoBXybfM4uCBTQFXMLaUnZ18GGNrFp6jXUk4HpTIFtVf9MUnFZF6K9JHm79LeW24OGEF0Dp
	kwna3uHIjVZvfzhDbckHQsJ8ljdrUJqlKnKBBQozamSHfI/AxYZjyvhZONIkmyJyTg99lcAMB8F
	WZEZUDrBN6UuiVVCSv1JEvO9rEAHTBVA6CFXoIKdbtxjKxX0MkDYNhAvzD53w0Wf2GEw=
X-Received: by 2002:a05:622a:2598:b0:546:92f2:7830 with SMTP id
 d75a77b69052e-55add216af2mr14131991cf.6.1794587470995; Fri, 13 Nov 2026
 08:31:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com> <20261113-perf_fix_gcc15_failure-v1-1-eae592c5ff64@arm.com>
In-Reply-To: <20261113-perf_fix_gcc15_failure-v1-1-eae592c5ff64@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 13 Nov 2026 08:30:59 -0800
X-Gm-Features: AclHuK81Umb631_b6CHlhoOVg9PPlSLmHdlP3oRotsMVgTGCQSYiylEnl9LWtQE
Message-ID: <CAP-5=fXrP+FSmv35KgvwDkNED921X60W3BWiMYHmLV-AzSG4BA@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf cs-etm: Initialize the Thumb instruction buffer
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Robert Walker <robert.walker@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_083113_157570_698DF73E 
X-CRM114-Status: GOOD (  17.75  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 2:55=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> cs_etm__frontend_mem_access() can return zero or a short read without
> fully initializing instrBytes. cs_etm__t32_instr_size() nevertheless
> inspects its second byte. With CORESIGHT=3D1 and -O3, GCC 15.2.0 reports:
>
>   error: 'instrBytes' may be used uninitialized
>
> Zero-initialize the buffer to avoid reading uninitialized stack data
> when instruction memory is unavailable and fix the build failure.
>
> Reported-by: Ian Rogers <irogers@google.com>
> Closes: https://lore.kernel.org/linux-perf-users/20261030-perf_cs_etm_fix=
_non_taken-v3-0-7629b52ab047@arm.com/T/#m64fb81c665214b79883d9be815b40ac5f6=
669628
> Fixes: a7ee4d625ede ("perf cs-etm: Support for ARM A32/T32 instruction se=
ts in CoreSight trace")
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks!
Ian

> ---
>  tools/perf/util/cs-etm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 3e01b401ca6f3a08f44bb69204317efaf2fa18d0..25f12bd110934a204d79244f4=
5317085b7a81666 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1369,7 +1369,7 @@ static inline int cs_etm__t32_instr_size(struct cs_=
etm_queue *etmq,
>                                          struct cs_etm_traceid_queue *tid=
q,
>                                          struct cs_etm_packet *packet, u6=
4 addr)
>  {
> -       u8 instrBytes[2];
> +       u8 instrBytes[2] =3D { 0 };
>
>         cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
>                                     ARRAY_SIZE(instrBytes), instrBytes);
>
> --
> 2.34.1
>

