Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F8360A261D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZyKij7nu;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=m09jZh6T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bbe99r7ldGy+3LHPoWZzc4j81Y95tpvjwCTeCgDNgYE=; b=ZyKij7nu5ehrSw
	RpO7x029sn1fiBdRSRghv1xdKkqOrdPrfZU1Fi9I4QWo8LEcyjcgXCciZX/ONJSU8XMQn6V1X0qnS
	h3zOkWRv1H7kdNeLkcLD4M4C1RUjJiW0F9pbVm3DQCPFIoY1Y93Lx+pEZzd5dVh6arBXuewBuR2dY
	e91FPrKnBIE/oip6VdC4kWUAg8l+PaPt8dsLvLRGghNNBvS8GOVdGGobWOZE0MT7utcKc4W4UYayP
	mzrnFdvgYDZ3Ap8l1o4CUJ5bdjpp+XL44SQ4ROvItHmZdGpnHeIZaaK00MLvrmCU/3Z2MJB55yUHU
	ThtaKCuZUktAFNwzhi4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlOW-0000000BqJD-1fju;
	Fri, 13 Nov 2026 07:08:20 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRlON-0000000BqHf-3Icj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:08:18 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5383c97c8cfso186651cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 23:08:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794553689; cv=none;
        d=google.com; s=arc-20260327;
        b=qp83Uuq/wocu3wLZANUBFzVt18n9RbvpCxmg6ccvmOA55wHSJRLSjwyPZFAHsdu+oL
         ShmJlTnyUbYpP4VZjI79YODFgxjW+fe2uH+eILOkzWtD3rSlPuLB1OEpakqxbTzh1+Ky
         w3i/3MbQ3+N+HE149faDrr1dJ7GDQsIXkiuAH0v39ijQSTfZ/6QhowsNB/yVGMRosK2n
         uKIeMVjX4l8qx1fPcoUNOSbJCarEywG4svC96Fvz405VoDZscWsOqwufTmrtAi3/BNV1
         Q9wmoHZqRcGUmjP4Ofmu3JHaWR/SK6kNDKYo3Dwx6ruxjBr+E7qkjTyH0KAAcSn0swmN
         MZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bbe99r7ldGy+3LHPoWZzc4j81Y95tpvjwCTeCgDNgYE=;
        fh=lFNvuP8z+7YbBdoFbSWEHeed2a+2xaLYe6peraht5EY=;
        b=UxstFikMnUdqNXQABiksIA0XkpV0xvgYVGaCOEzePnlkdoSr4z7j4xjcokI+3+8OKh
         gEugGVqldHg3NhMrO+3NrYqMv5rfWFDcF7QTS0uE7Njappx1L4sKVCoir3qj4KSXy0fy
         Yamt+Q3xJPxY236zZLJJ431YXoQzLXofWdP/5gvdjil1jDkgt/bCQMyouGW++0wvIvu7
         rCNpKgmwYTscU+U/zvAvQeG45MFn4BX7IgY0eCEr/K3LkPf1effHp3HlLo6l6uaUw9rA
         9erP/mzq8KMgvdvBpe3GoUXLyYIlHNromgsP+UCLBXu+87eCzZP2nCATud4m0pN/ZAAH
         24+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794553689; x=1795158489; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bbe99r7ldGy+3LHPoWZzc4j81Y95tpvjwCTeCgDNgYE=;
        b=m09jZh6TM4Ik+hTBpanUjCPtJOZD0g8JeFSFkvNZ2dmx0Vuiz4TlaSe9NTMbFvXLRk
         vGdYuCAMsxKHMjHgNCHn4KCBT/bj808IDQadeK6TOk4R3f6A3gl61yEnJ6sSpnKpMwCF
         kTfl5oeP9+95Jpr+lXZwenXfFEqkUTSsf2zzHk+mQw0tp4bbEPbpYfPwGhXfgH2I3Xnd
         Wx2Po0dqQ54dI1dPvVDv83k9LBDstp7j+m1HU5j/q5I7rzHlD3KRBd2cSCnWuEsA7Gw7
         9A3Kd2OBuew/zrIhoRKfuF8kxx2p6/5zibDoNU5ME7kKhUsl5Lx233f79vBbjwwz7158
         VQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794553689; x=1795158489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bbe99r7ldGy+3LHPoWZzc4j81Y95tpvjwCTeCgDNgYE=;
        b=22FyTYHnNC+WzEdqfIz7iDJW2+7WnafZpnUKdKJJ6loztDB41OnLVJX1JyTvqoXfnZ
         cbbt3rPIuhShD+0BLCdI0wpzR7snIgfVYAY0ZSAiuvXWL9E5aIYhJwBS8v2kfZG7pVOr
         7DBzRkfLv4zt1BSnAZbSZNp+dJmkHY/4F3Qpqx53oauLSsXHyTJO/9wDhmV9fIPR4j4W
         5fuyQaTjPIAW2BLExG/kDmF1t7ns410mbW9+miEIBN1SfWDOjZ64rmzSaI7RsbjRoOun
         bKC1mxR+035qC+Srw4pGJ6azZRd493cc9U+XPnrY9cygrs23Z1lYq4051alquSz3Yt/L
         lUGA==
X-Forwarded-Encrypted: i=1; AL+hErGsijSqGxj4+qWFyLNLMtppvcCOSkJHMn7BMgxGfvT5kdR9NrxO/dQSf5ywmDsCYstkD5b+AwLaOsLQ8g+DQHW2@lists.infradead.org
X-Gm-Message-State: APuU4Z8KfRCwx4yyrz99XF18OyFqlWFGqIKNSjojmw4GccNj7DfMEOC0
	JzUCq+EL/kzLTsVfXpGc1p65ymmt6mFITJczevjPnUC15fVzZQqiVTCNXNJWnMrpDMjEMGYDz2M
	zNFB18EacQ4szCs8VzZ8n3KHt11c3EBP6Bqzdm1zw
X-Gm-Gg: AYBFou1tFvmI5iAJPVmpDFMfvBWdWW8k0TL+NptfntjUtjrrFQES7oezfJqOppxlOH1
	x665A2fhtcyjo/NHAbeeZLrrpvJo+zSvj1hhCyVlLstHf1v7xnhbLdHnx/AnFLBhUBnhvNiKYqw
	YbzgMk+toXZDyaVUeisHtQhk0e9qC8RomWUGR52Glh4Z9lGyfDzWWDcyFgAWgjhrWo3JqcKKONX
	bpGTPrVuftStFrtK5btiUtcKFhr7mFeu+ScbFY0nzTmRrJCTG2lJ5eJZYqMkVbYLyBrtkFH0fOi
	HjES6+wAmXGZq7paP54qkSNBdOnWOjj7sKTZXkytUHDdBYFY9HiAZ1XJBlZhBelaSPbBZJ5pn8F
	eUT4oRCTBEpRpKZPcqfgLrN+bGza53+oJt3hM
X-Received: by 2002:a05:622a:408d:b0:530:e335:4ef with SMTP id
 d75a77b69052e-55ad7e74d7dmr6692551cf.2.1794553688471; Thu, 12 Nov 2026
 23:08:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030-perf_cs_etm_fix_non_taken-v3-0-7629b52ab047@arm.com> <20261030-perf_cs_etm_fix_non_taken-v3-10-7629b52ab047@arm.com>
In-Reply-To: <20261030-perf_cs_etm_fix_non_taken-v3-10-7629b52ab047@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 12 Nov 2026 23:07:55 -0800
X-Gm-Features: AclHuK-AnxLYHKF4-9qpseOsqe_AfHtt2i5OGLHh-0sk5gi77CYMBej7Kg_rG1c
Message-ID: <CAP-5=fUMwOb6Gj+5DOu9-yNmthDz5ghAqrzmZ4ACX0g+9WB59w@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] perf cs-etm: Synthesize exception entries
 separately from branches
To: Leo Yan <leo.yan@arm.com>, James Clark <james.clark@linaro.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Mike Leach <mike.leach@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_230811_911008_F0C2828A 
X-CRM114-Status: GOOD (  41.61  )
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

On Fri, Oct 30, 2026 at 8:13=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> Exception entry is currently represented by replacing the preceding
> range's flags and forcing its last_instr_taken_branch bit. This gives
> an interrupt the source address of the last executed instruction. When
> that instruction is a taken branch, its edge and original flags are lost.
>
> For example, consider an untaken B.LS followed by an IRQ:
>
>   4000f4: eb02003f  cmp  x1, x2
>   4000f8: 54000109  b.ls 400118
>   4000fc: d282f2c2  mov  x2, #0x1796
>
> If B.LS completes untaken and the IRQ is taken before MOV completes, the
> preferred exception return address is 4000fc. With kernel tracing disable=
d,
> perf script previously attributed the IRQ to the preceding range:
>
>   tr end  hw int  4000f8 =3D> 0       b.ls #0x400118
>   tr strt jmp          0 =3D> 4000fc
>
> When an IRQ element provides that return address, use it as the source of
> the synthesized exception sample:
>
>   tr end  hw int  4000fc =3D> 0       movz x2, #0x1796
>   tr strt jmp          0 =3D> 4000fc
>
> The source now identifies the architectural resume PC, rather than the
> last completed instruction. The IRQ signal could have arrived while B.LS
> was executing. The traced preferred exception return address of 4000fc
> confirms that B.LS had retired architecturally before the IRQ was taken.
>
> OpenCSD provides an exception's preferred return address in en_addr when
> excep_ret_addr is set. It does not define or initialize st_addr for an
> exception element. Derive A32 and A64 exception source PCs from the
> preferred return address. Exception calls (SVC/SMC/HVC) use the preceding
> four-byte instruction; interrupts, faults and traps use the return
> address with last_instr_size set to zero.
>
> Use pref_ret_addr when deriving exception source PCs in the decoder and
> cs_etm__last_executed_instr(), and when setting sample.ret_addr.
>
> Keep T32 exception samples on the existing fallback path because
> determining the call size requires an instruction read. Retain
> pref_ret_addr for the frontend's SVC check. RESET and missing return
> addresses also use the fallback because their source PC is unknown.
>
> Resolve the preceding branch with its original flags without adding
> instructions. Then retain the exception in prev_packet until the next
> range, exception or discontinuity resolves its destination. This preserve=
s
> both edges when an exception follows a taken branch and also handles
> consecutive exceptions.
>
> Supply the preferred return address in sample.ret_addr so later instructi=
on
> fetching cannot change the return PC used by call/return export. Generate
> final instruction samples only from nonempty instruction ranges.
>
> CS_ETM_EXCEPTION_RET needs no further handling in the packet processing
> loop because ERET is already part of the preceding instruction range.
> cs_etm__set_sample_flags() now sets both that range's return flags and
> last_instr_taken_branch.
>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>

Hi Leo,

After commit 9648f9fc3525 ("perf cs-etm: Synthesize exception entries
separately from branches") in perf-tools-next, perf's build-test
(`make -C tools/perf O=3D/tmp/build CORESIGHT=3D1`, i.e. `make_with_coresig=
ht_O`)
with GCC 15.2.0 (`gcc (Debian 15.2.0-14) 15.2.0`, `-O3`) fails with:

  In function =E2=80=98cs_etm__t32_instr_size=E2=80=99,
      inlined from =E2=80=98cs_etm__instr_size=E2=80=99 at util/cs-etm.c:13=
90:10,
      inlined from =E2=80=98cs_etm__copy_insn=E2=80=99 at util/cs-etm.c:157=
2:21:
  util/cs-etm.c:1381:28: error: =E2=80=98instrBytes=E2=80=99 may be used un=
initialized
 [-Werror=3Dmaybe-uninitialized]
   1381 |         return ((instrBytes[1] & 0xF8) >=3D 0xE8) ? 4 : 2;
            |                  ~~~~~~~~~~^~~
  util/cs-etm.c: In function =E2=80=98cs_etm__copy_insn=E2=80=99:
  util/cs-etm.c:1372:12: note: =E2=80=98instrBytes=E2=80=99 declared here
   1372 |         u8 instrBytes[2];
            |            ^~~~~~~~~~

The uninitialized `instrBytes` in cs_etm__t32_instr_size() is actually
pre-existing from commit a7ee4d625ede ("perf cs-etm: Support for ARM
A32/T32 instruction sets in CoreSight trace"): cs_etm__frontend_mem_access(=
)
(via __cs_etm__mem_access()) can return 0 without writing to instrBytes
when thread__find_map(), map__dso(), or dso__data_read_offset() fails.
The changes around cs_etm__copy_insn() in this patch just shifted GCC's
-O3 inlining enough for it to inline __cs_etm__mem_access() and spot the
uninitialized read of instrBytes[1].

Zero-initializing `u8 instrBytes[2] =3D {};` (similar to instr16/instr32 in
cs_etm__is_svc_instr()) or checking that cs_etm__frontend_mem_access() read
ARRAY_SIZE(instrBytes) bytes before inspecting instrBytes[1] should fix it.

Thanks,
Ian

> ---
>  tools/perf/util/cs-etm-decoder/cs-etm-decoder.c |  31 ++++++-
>  tools/perf/util/cs-etm.c                        | 106 +++++++++++++++---=
------
>  tools/perf/util/cs-etm.h                        |   1 +
>  3 files changed, 95 insertions(+), 43 deletions(-)
>
> diff --git a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c b/tools/perf=
/util/cs-etm-decoder/cs-etm-decoder.c
> index ccae10e6cdad55607e092b90a1a940103fa050d7..b9397151748b222ae4542394c=
7b974b0fdb69bba 100644
> --- a/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> +++ b/tools/perf/util/cs-etm-decoder/cs-etm-decoder.c
> @@ -514,6 +514,7 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue =
*etmq,
>  {
>         int ret =3D 0;
>         struct cs_etm_packet *packet;
> +       u8 last_instr_size =3D 0;
>
>         ret =3D cs_etm_decoder__buffer_packet(etmq, queue, elem, trace_ch=
an_id,
>                                             CS_ETM_EXCEPTION);
> @@ -524,8 +525,34 @@ cs_etm_decoder__buffer_exception(struct cs_etm_queue=
 *etmq,
>         packet->exception_number =3D elem->exception_number;
>         if (elem->context.el_valid)
>                 packet->el =3D elem->context.exception_level;
> -       if (elem->excep_ret_addr)
> -               packet->pref_ret_addr =3D elem->en_addr;
> +
> +       /* RESET has no defined preferred return address. */
> +       if (!elem->excep_ret_addr ||
> +           packet->exception_number =3D=3D CS_ETMV4_EXC_RESET)
> +               return ret;
> +
> +       packet->pref_ret_addr =3D elem->en_addr;
> +
> +       /*
> +        * T32 calls can be two or four bytes, requiring an instruction r=
ead
> +        * before pref_ret_addr to determine their size. Keep it for the
> +        * frontend's SVC check and leave start_addr unknown for its fall=
back.
> +        */
> +       if (packet->isa !=3D CS_ETM_ISA_A32 && packet->isa !=3D CS_ETM_IS=
A_A64)
> +               return ret;
> +
> +       /*
> +        * For A32 and A64, exception calls execute a four-byte SVC, HVC =
or
> +        * SMC and save the following PC. Other exceptions use the interr=
upted
> +        * or faulting PC, including traps on those instructions.
> +        *
> +        * With a shared branch target, no instruction has completed
> +        * at the target, so last_instr_size remains zero.
> +        */
> +       if (elem->exception_number =3D=3D CS_ETMV4_EXC_CALL)
> +               last_instr_size =3D 4;
> +       packet->start_addr =3D packet->pref_ret_addr - last_instr_size;
> +       packet->last_instr_size =3D last_instr_size;
>
>         return ret;
>  }
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 14a6466255017386addaee539141bf89b6dcf76f..c8a6a6e4c7d3b4c9d58f3a5b4=
6587ee53c864b2e 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -101,10 +101,8 @@ struct cs_etm_traceid_queue {
>         ocsd_ex_level decode_el;
>
>         /*
> -        * The frontend accesses the EL from '[prev_]packet' because it n=
eeds
> -        * previous EL for branch and current EL for instruction samples.=
 It's
> -        * not possible to change thread in a single branch sample so no =
need to
> -        * store or access the thread through the packet.
> +        * Samples use the EL saved in their source packet. A branch samp=
le
> +        * cannot change thread, so the thread is kept in the frontend co=
ntext.
>          */
>         struct thread *frontend_thread;
>  };
> @@ -1397,11 +1395,10 @@ static inline int cs_etm__instr_size(struct cs_et=
m_queue *etmq,
>  static inline u64 cs_etm__first_executed_instr(struct cs_etm_packet *pac=
ket)
>  {
>         /*
> -        * Return 0 for packets that have no addresses so that CS_ETM_INV=
AL_ADDR doesn't
> -        * appear in samples.
> +        * Return 0 for discontinuities so that CS_ETM_INVAL_ADDR doesn't=
 appear
> +        * in samples.
>          */
> -       if (packet->sample_type =3D=3D CS_ETM_DISCONTINUITY ||
> -           packet->sample_type =3D=3D CS_ETM_EXCEPTION)
> +       if (packet->sample_type =3D=3D CS_ETM_DISCONTINUITY)
>                 return 0;
>
>         return packet->start_addr;
> @@ -1414,6 +1411,9 @@ u64 cs_etm__last_executed_instr(const struct cs_etm=
_packet *packet)
>         if (packet->sample_type =3D=3D CS_ETM_DISCONTINUITY)
>                 return 0;
>
> +       if (packet->sample_type =3D=3D CS_ETM_EXCEPTION)
> +               return packet->pref_ret_addr - packet->last_instr_size;
> +
>         return packet->end_addr - packet->last_instr_size;
>  }
>
> @@ -1580,6 +1580,9 @@ static void cs_etm__copy_insn(struct cs_etm_queue *=
etmq,
>                 return;
>         }
>
> +       if (packet->sample_type =3D=3D CS_ETM_EXCEPTION && !sample->insn_=
len)
> +               return;
> +
>         cs_etm__frontend_mem_access(etmq, tidq, packet, sample->ip,
>                                     sample->insn_len, (void *)sample->ins=
n);
>  }
> @@ -1606,8 +1609,11 @@ static inline u64 cs_etm__resolve_sample_time(stru=
ct cs_etm_queue *etmq,
>                 return etm->latest_kernel_timestamp;
>  }
>
> -static bool cs_etm__packet_has_taken_branch(struct cs_etm_packet *packet=
)
> +static bool cs_etm__packet_has_branch(struct cs_etm_packet *packet)
>  {
> +       if (packet->sample_type =3D=3D CS_ETM_EXCEPTION)
> +               return true;
> +
>         if (packet->sample_type =3D=3D CS_ETM_RANGE &&
>             packet->last_instr_taken_branch)
>                 return true;
> @@ -1625,7 +1631,7 @@ static void cs_etm__add_stack_event(struct cs_etm_q=
ueue *etmq,
>         if (!etm->synth_opts.branches && !etm->synth_opts.instructions)
>                 return;
>
> -       if (!cs_etm__packet_has_taken_branch(tidq->prev_packet))
> +       if (!cs_etm__packet_has_branch(tidq->prev_packet))
>                 return;
>
>         if (etmq->etm->use_thread_stack) {
> @@ -1737,7 +1743,8 @@ static int cs_etm__synth_last_instruction_sample(st=
ruct cs_etm_queue *etmq,
>             !etmq->etm->synth_opts.instructions)
>                 return 0;
>
> -       if (packet->sample_type !=3D CS_ETM_RANGE)
> +       /* Only nonempty ranges provide a final instruction to sample. */
> +       if (packet->sample_type !=3D CS_ETM_RANGE || !packet->instr_count=
)
>                 return 0;
>
>         ret =3D cs_etm__synth_instruction_sample(etmq, tidq, packet,
> @@ -1771,7 +1778,7 @@ static int cs_etm__synth_branch_sample(struct cs_et=
m_queue *etmq,
>         if (!etm->synth_opts.branches)
>                 return 0;
>
> -       if (!cs_etm__packet_has_taken_branch(tidq->prev_packet) &&
> +       if (!cs_etm__packet_has_branch(tidq->prev_packet) &&
>             !(tidq->prev_packet->flags & (PERF_IP_FLAG_TRACE_BEGIN |
>                                           PERF_IP_FLAG_TRACE_END)))
>                 return 0;
> @@ -1802,6 +1809,9 @@ static int cs_etm__synth_branch_sample(struct cs_et=
m_queue *etmq,
>         sample.flags =3D tidq->prev_packet->flags;
>         sample.cpumode =3D event->sample.header.misc;
>
> +       if (tidq->prev_packet->sample_type =3D=3D CS_ETM_EXCEPTION)
> +               sample.ret_addr =3D tidq->prev_packet->pref_ret_addr;
> +
>         cs_etm__copy_insn(etmq, tidq, tidq->prev_packet, &sample);
>
>         /*
> @@ -2052,21 +2062,23 @@ static int cs_etm__context(struct cs_etm_queue *e=
tmq,
>         return ret;
>  }
>
> -static int cs_etm__exception(struct cs_etm_traceid_queue *tidq)
> +static int cs_etm__exception(struct cs_etm_queue *etmq,
> +                            struct cs_etm_traceid_queue *tidq)
>  {
> +       struct cs_etm_packet *packet =3D tidq->packet;
> +
>         /*
> -        * When the exception packet is inserted, whether the last instru=
ction
> -        * in previous range packet is taken branch or not, we need to fo=
rce
> -        * to set 'prev_packet->last_instr_taken_branch' to true.  This e=
nsures
> -        * to generate branch sample for the instruction range before the
> -        * exception is trapped to kernel or before the exception returni=
ng.
> -        *
> -        * The exception packet does not describe an instruction range, s=
o don't
> -        * swap PACKET with PREV_PACKET.  This keeps PREV_PACKET to be us=
eful
> -        * for generating instruction and branch samples.
> +        * Resolve the preceding branch without adding instructions, then=
 keep
> +        * this exception as prev_packet until its destination is known.
>          */
> -       if (tidq->prev_packet->sample_type =3D=3D CS_ETM_RANGE)
> +       if (packet->start_addr !=3D CS_ETM_INVAL_ADDR)
> +               return cs_etm__sample(etmq, tidq);
> +
> +       /* Fall back to attributing the exception to the preceding range.=
 */
> +       if (tidq->prev_packet->sample_type =3D=3D CS_ETM_RANGE) {
> +               tidq->prev_packet->flags =3D packet->flags;
>                 tidq->prev_packet->last_instr_taken_branch =3D true;
> +       }
>
>         return 0;
>  }
> @@ -2463,7 +2475,8 @@ static int cs_etm__set_sample_flags(struct cs_etm_q=
ueue *etmq,
>                  * instruction packet, set flag PERF_IP_FLAG_TRACE_END
>                  * for previous packet.
>                  */
> -               if (prev_packet->sample_type =3D=3D CS_ETM_RANGE)
> +               if (prev_packet->sample_type =3D=3D CS_ETM_RANGE ||
> +                   prev_packet->sample_type =3D=3D CS_ETM_EXCEPTION)
>                         prev_packet->flags |=3D PERF_IP_FLAG_BRANCH |
>                                               PERF_IP_FLAG_TRACE_END;
>                 break;
> @@ -2495,15 +2508,23 @@ static int cs_etm__set_sample_flags(struct cs_etm=
_queue *etmq,
>                                         PERF_IP_FLAG_CALL |
>                                         PERF_IP_FLAG_INTERRUPT;
>
> -               /*
> -                * When the exception packet is inserted, since exception
> -                * packet is not used standalone for generating samples
> -                * and it's affiliation to the previous instruction range
> -                * packet; so set previous range packet flags to tell per=
f
> -                * it is an exception taken branch.
> -                */
> -               if (prev_packet->sample_type =3D=3D CS_ETM_RANGE)
> -                       prev_packet->flags =3D packet->flags;
> +               if (packet->start_addr =3D=3D CS_ETM_INVAL_ADDR)
> +                       break;
> +
> +               /* Resolve the preceding trace start or exception return.=
 */
> +               if (prev_packet->sample_type =3D=3D CS_ETM_DISCONTINUITY)
> +                       prev_packet->flags |=3D PERF_IP_FLAG_BRANCH |
> +                                             PERF_IP_FLAG_TRACE_BEGIN;
> +
> +               if (prev_packet->flags =3D=3D (PERF_IP_FLAG_BRANCH |
> +                                          PERF_IP_FLAG_RETURN |
> +                                          PERF_IP_FLAG_INTERRUPT) &&
> +                   cs_etm__is_svc_instr(etmq, tidq, packet,
> +                                        packet->start_addr)) {
> +                       prev_packet->flags =3D PERF_IP_FLAG_BRANCH |
> +                                            PERF_IP_FLAG_RETURN |
> +                                            PERF_IP_FLAG_SYSCALLRET;
> +               }
>                 break;
>         case CS_ETM_EXCEPTION_RET:
>                 /*
> @@ -2531,10 +2552,12 @@ static int cs_etm__set_sample_flags(struct cs_etm=
_queue *etmq,
>                  * system call instruction and then calibrate the sample =
flag
>                  * as needed.
>                  */
> -               if (prev_packet->sample_type =3D=3D CS_ETM_RANGE)
> +               if (prev_packet->sample_type =3D=3D CS_ETM_RANGE) {
>                         prev_packet->flags =3D PERF_IP_FLAG_BRANCH |
>                                              PERF_IP_FLAG_RETURN |
>                                              PERF_IP_FLAG_INTERRUPT;
> +                       prev_packet->last_instr_taken_branch =3D true;
> +               }
>                 break;
>         case CS_ETM_CONTEXT:
>         case CS_ETM_EMPTY:
> @@ -2610,7 +2633,9 @@ static int cs_etm__process_traceid_queue(struct cs_=
etm_queue *etmq,
>                          * range, generate instruction sequence
>                          * events.
>                          */
> -                       cs_etm__sample(etmq, tidq);
> +                       ret =3D cs_etm__sample(etmq, tidq);
> +                       if (ret)
> +                               goto out;
>                         break;
>                 case CS_ETM_CONTEXT:
>                         /*
> @@ -2624,13 +2649,12 @@ static int cs_etm__process_traceid_queue(struct c=
s_etm_queue *etmq,
>                                 goto out;
>                         break;
>                 case CS_ETM_EXCEPTION:
> +                       ret =3D cs_etm__exception(etmq, tidq);
> +                       if (ret)
> +                               goto out;
> +                       break;
>                 case CS_ETM_EXCEPTION_RET:
> -                       /*
> -                        * If the exception packet is coming,
> -                        * make sure the previous instruction
> -                        * range packet to be handled properly.
> -                        */
> -                       cs_etm__exception(tidq);
> +                       /* The return annotates the preceding instruction=
 range. */
>                         break;
>                 case CS_ETM_DISCONTINUITY:
>                         /*
> diff --git a/tools/perf/util/cs-etm.h b/tools/perf/util/cs-etm.h
> index e40b9b7d0a9bd90f089c2f20527332264ead4249..bf0e0f5a9711f8d450ea8a0f9=
d67aa5e8d7204ab 100644
> --- a/tools/perf/util/cs-etm.h
> +++ b/tools/perf/util/cs-etm.h
> @@ -173,6 +173,7 @@ struct cs_etm_queue;
>  struct cs_etm_packet {
>         enum cs_etm_sample_type sample_type;
>         enum cs_etm_isa isa;
> +       /* For exceptions: source PC, or CS_ETM_INVAL_ADDR. */
>         u64 start_addr;
>         union {
>                 u64 end_addr;           /* Range packets */
>
> --
> 2.34.1
>

