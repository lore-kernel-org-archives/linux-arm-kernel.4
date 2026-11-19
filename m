Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70386606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ThSxGyvu;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Wqk5FPwN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s1nV4pJB/Pg9LULexQxieGs66dNhcFkD3Zb94PHOxG0=; b=ThSxGyvuz//TFo
	+4cup8J7Cz9LJejhS0w5+VpgNUWnP60qTECpxWWXGOP1O1bM3Qbyhp38xpLD+mBlJNYMuejZ7stdU
	HLoZqn1OMeHBL4brB+WWnYfF4kr26eoWi8oQXeFtzxNwuw0D/jUw64qt3mXlW1aBYpTQc2+o9J+fT
	JCauNx0Id5PHN++2T4zUJAsMET0EblBGQCs1SPm+h9LazasXpg9H3hBHm0nhlZKYkLrBqdc4oRE9/
	WNTcgmuT10Mjr+fm2JWDdCYcj9FeihZFEA2hgCg5OSIP4qtay+IdIZ9nuPcDy+6cW4iSh+qaO86vP
	Yqt+9CrjYpI31oEkdB1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3t0-0000000COr1-32WA;
	Thu, 19 Nov 2026 15:17:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3sx-0000000COos-1Zik
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:17:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so7540325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 07:17:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795101431; cv=none;
        d=google.com; s=arc-20260327;
        b=cbKTwTcNK2Z7vgnZKuxUdKQktha1Jbu8+UN1yjcuvuJuzudEYwP3MmkhnXJWAIjbdk
         +Zks1lgEI0KMCqHCRdi2q+b3Wq1tpefD3FR3FIlQ52Lz150l8znPCTqvCOFiTH4cYXU3
         Fmsx3ekoCaPJTuELr3ljIAEImojwN9FsxnU0EBXKDUzxiEWbgaDEesvJ/1sN524d5kjY
         K/60SW0kTlscGjdr547+upU2I95wSvu2JyDQrNBor7ffcUwqH+Hhnzefit6SzYThSmcO
         rdYWXMP3jGNkrvb6oRycujHQ1W5aNEfC4hHhohq9+ytABC4qJjhWFwifnV9BfcGJWUZY
         JJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s1nV4pJB/Pg9LULexQxieGs66dNhcFkD3Zb94PHOxG0=;
        fh=73hJ2AvGPW37OCpblsqmX3HmcpiJtW/WuP+7J39yIYM=;
        b=BqwTJ73fNA1973IgU/ry2i+gV9dWD/oUKbNvFDpRkLgRmsbC7nHd5C5cufAz2APHuj
         KTyYX68BmGbJAIZnKMmH+rbmTLlkRK84PxKcXdz1UM0tWoD11SXbD5jIAtQ8YiJO0FOB
         bNWrR6MOTIe5JmGH2QGhPPpnRAgQs8r++QC16yfCapJuBApbBex//KLnmQkX6U7qtg+I
         zFxkn6ZrpLujLBi+goscLW6ZYflyWabkUfA1l1ukAHqvwsD7xh/g8MAVy6UxFpYLzdlI
         177IlSUHp5hfj1M/AESbCb/O0hS2D1K/8Pajk/8yLVIz/zXAxerLNJraf8dpdJZ/riXd
         mM5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795101431; x=1795706231; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s1nV4pJB/Pg9LULexQxieGs66dNhcFkD3Zb94PHOxG0=;
        b=Wqk5FPwNC39Td4n7/lbukyI1lEFPOjCRJ5YQTDI3ip3gFRzLPiFNjgpssgECH+HldQ
         ROUmu/TzU9p5XRJ2dnMIwwIwGSOrkzyYNL9fUfIkvOxQMLnI/LK7ilJpBKCnMEz6PGWl
         I5UbeQee/jHDBUBWOzxyS75joF7jI2j5JnxtIli1RgqgsHWqzeSbdqqQgRv/A1GLSbdg
         qmQP9/1yiyeFfeiiPzqWLDw4nGWFhoy8NyThpUYgVlFkAgAVWR7HTiKlOXuRW3OP84uG
         K+Yr7t0tEetRtFjHq9UOdiEg4eb8lQBPkEQ6MLKVdyPIiws+BZpfHFri/btjm+Waequg
         ablQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101431; x=1795706231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s1nV4pJB/Pg9LULexQxieGs66dNhcFkD3Zb94PHOxG0=;
        b=G+cU8xm5GGpgcrWcrFon7QulyKDhhtZLYR6VjKojJx5c45Fhinl9ps4ARp7LWRTvE/
         fSYKrD2na7DgW4htvEt4cuazv8rigRDzhhenKAIE0tnnq1/Aj3hDNRzZ86Y3KL3fMfZM
         H/NJWyOAsa7TxpdP9o3ksE4vYsoxu+DqJghhqOxKCxG4kMZHi1FaYLDYchpR0+qLIFsW
         6TEf2dfYnFMt6PmCaYsKt++lJD6FNHFMNpeYLmdQe9dfRwVPU08UtkGh5tXfknvqIxha
         h3uNk8m0WE9H88i3rQeYWDB65JNFUgIQJq3XNRjlynjYQw/Ldg7EQY5LlgM8LI82qvBU
         siCw==
X-Forwarded-Encrypted: i=1; AL+hErEcS/vLJKQmtLI7bkUvCVA/PJR8XIjmWwx3YXHTUYJuZD0pwaVXKud68ubr66kEhx6vJGvv2pYoArPc2FhsPQQv@lists.infradead.org
X-Gm-Message-State: APuU4Z8Q3PYXJLCYQFPmpGoGzaN/yNLy64WI+iL6HYTVV4cfvMhjmLEW
	wIcSletHf0hGQbSqjhuv/HPTX7aOjmXh5vQKQ13Y9oJ/YfyRaedJcRhdELbS+xYKr3tfqEyD6wZ
	QS4iqRvb7RG9tIP72xsazq2Z0ovv2j/esajTLgOMhXw==
X-Gm-Gg: AYBFou3wBz5XSQpYMo94uHG2locXeJT6qnihu0sXOwoSqv+MULFEqBFxh+hmsRBJtrf
	A27EhXzVflRZq+9j2WmCIkXEVOky56VCF6O1g7m55yuLQ8pufetj2b1MuEP4e0OuafaQHTuLwnb
	MMfhucF2+th85RjoK6xZjdjLhTyWITaWl6PV7Cm2rmkzvA+PhsOr3WQ2qiJQmgG1oWarw5JH6O4
	sBdPdW5CdnZCjb+MDQNNNbD+CMh8iQhcbxt58q57HzIfa+Rr4T/Vu7xSMA7yrHXzpy5cYdZKjm1
	h6uzYs2vwwhZ9YevXCZKJev4l+6t/y1vB5MMId3HPqoGJiFqTFTmholqeUKI/zbSnDuH091DySp
	3m8cxvGfZOowBUK+q96t36tJjh25+8dqradcgubKkXKi0e7k4Ws2/3qMaT+J9Ir4BlEisn4mChZ
	SkdNc39dWXBIroDXhHfBQ9c42S1hvcEXjDaAHJTMvGp2fURJA7MMegTdc=
X-Received: by 2002:a05:600c:314f:b0:4a1:c6f5:2450 with SMTP id
 5b1f17b1804b1-4bb8612e0ecmr32385565e9.17.1795101431510; Thu, 19 Nov 2026
 07:17:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-3-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-3-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 20:46:59 +0530
X-Gm-Features: Aa3M54rT33sHedk6b52_SmmeeC6_QwQxOJWE_LlMaSuUzG5nqW2zaQJ7Y3n50ik
Message-ID: <CAAhSdy1YOv2hBe9zi+yJ=fmVEfWi9iGSxxKJ7uZbSHowTj7NOg@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] riscv: pmu: Add Control transfer records CSR definations.
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
X-CRM114-CacheID: sfid-20261119_071715_463866_8619C079 
X-CRM114-Status: GOOD (  14.10  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 3:21=E2=80=AFPM Vikram Singh
<vikram.singh3@oss.qualcomm.com> wrote:
>
> Adding CSR defines for RISCV Control Transfer Records extension [0]
> along with bit-field macros for each CSR.
>
> [0]: https://github.com/riscv/riscv-control-transfer-records
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-3-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  arch/riscv/include/asm/csr.h | 95 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 621f84d1898f..063351d9b406 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -350,6 +350,97 @@
>
>  #define CSR_SCOUNTOVF          0xda0
>
> +/* M-mode Control Transfer Records CSRs */
> +#define CSR_MCTRCTL            0x34e
> +
> +/* S-mode Control Transfer Records CSRs */
> +#define CSR_SCTRCTL            0x14e
> +#define CSR_SCTRSTATUS         0x14f
> +#define CSR_SCTRDEPTH          0x15f
> +
> +/* VS-mode Control Transfer Records CSRs */
> +#define CSR_VSCTRCTL           0x24e
> +
> +/* xctrtl CSR bits. */
> +#define CTRCTL_U_ENABLE                _AC(0x1, UL)
> +#define CTRCTL_S_ENABLE                _AC(0x2, UL)
> +#define CTRCTL_M_ENABLE                _AC(0x4, UL)
> +#define CTRCTL_RASEMU          _AC(0x80, UL)
> +#define CTRCTL_STE             _AC(0x100, UL)
> +#define CTRCTL_MTE             _AC(0x200, UL)
> +#define CTRCTL_BPFRZ           _AC(0x800, UL)
> +#define CTRCTL_LCOFIFRZ                _AC(0x1000, UL)
> +#define CTRCTL_EXCINH          _AC(0x200000000, UL)
> +#define CTRCTL_INTRINH         _AC(0x400000000, UL)
> +#define CTRCTL_TRETINH         _AC(0x800000000, UL)
> +#define CTRCTL_NTBREN          _AC(0x1000000000, UL)
> +#define CTRCTL_TKBRINH         _AC(0x2000000000, UL)
> +#define CTRCTL_INDCALL_INH     _AC(0x10000000000, UL)
> +#define CTRCTL_DIRCALL_INH     _AC(0x20000000000, UL)
> +#define CTRCTL_INDJUMP_INH     _AC(0x40000000000, UL)
> +#define CTRCTL_DIRJUMP_INH     _AC(0x80000000000, UL)
> +#define CTRCTL_CORSWAP_INH     _AC(0x100000000000, UL)
> +#define CTRCTL_RET_INH         _AC(0x200000000000, UL)
> +#define CTRCTL_INDOJUMP_INH    _AC(0x400000000000, UL)
> +#define CTRCTL_DIROJUMP_INH    _AC(0x800000000000, UL)
> +
> +/* sctrstatus CSR bits. */
> +#define SCTRSTATUS_WRPTR_MASK  0xFF
> +#define SCTRSTATUS_FROZEN      _AC(0x80000000, UL)
> +
> +#ifdef CONFIG_RISCV_M_MODE
> +#define CTRCTL_KERNEL_ENABLE   CTRCTL_M_ENABLE
> +#else
> +#define CTRCTL_KERNEL_ENABLE   CTRCTL_S_ENABLE
> +#endif
> +
> +/* sctrdepth CSR bits. */
> +#define SCTRDEPTH_MASK         0x7
> +
> +#define SCTRDEPTH_MIN          0x0 /* 16 Entries. */
> +#define SCTRDEPTH_MAX          0x4 /* 256 Entries. */
> +
> +/* ctrsource, ctrtarget and ctrdata CSR bits. */
> +#define CTRSOURCE_VALID                0x1ULL
> +#define CTRTARGET_MISP         0x1ULL
> +
> +#define CTRDATA_TYPE_MASK      0xF
> +#define CTRDATA_CCV            0x8000
> +#define CTRDATA_CCM_MASK       0xFFF0000
> +#define CTRDATA_CCE_MASK       0xF0000000
> +
> +#define CTRDATA_TYPE_NONE                      0
> +#define CTRDATA_TYPE_EXCEPTION                 1
> +#define CTRDATA_TYPE_INTERRUPT                 2
> +#define CTRDATA_TYPE_TRAP_RET                  3
> +#define CTRDATA_TYPE_NONTAKEN_BRANCH           4
> +#define CTRDATA_TYPE_TAKEN_BRANCH              5
> +#define CTRDATA_TYPE_RESERVED_6                        6
> +#define CTRDATA_TYPE_RESERVED_7                        7
> +#define CTRDATA_TYPE_INDIRECT_CALL             8
> +#define CTRDATA_TYPE_DIRECT_CALL               9
> +#define CTRDATA_TYPE_INDIRECT_JUMP             10
> +#define CTRDATA_TYPE_DIRECT_JUMP               11
> +#define CTRDATA_TYPE_CO_ROUTINE_SWAP           12
> +#define CTRDATA_TYPE_RETURN                    13
> +#define CTRDATA_TYPE_OTHER_INDIRECT_JUMP       14
> +#define CTRDATA_TYPE_OTHER_DIRECT_JUMP         15
> +
> +#define CTR_ENTRIES_FIRST      0x200
> +#define CTR_ENTRIES_LAST       0x2ff
> +
> +/* Temporary addresses for Sspesa (Precise Event Sample Attribution) CSR=
s. */
> +#define CSR_SHPMSPC            0x5d0
> +#define CSR_SHPMSDATA          0x5d1
> +
> +/* shpmsdata fields */
> +#define SHPMSDATA_CNTRID       GENMASK(4, 0)
> +#define SHPMSDATA_MODE         GENMASK(6, 5)
> +#define SHPMSDATA_V            BIT(7)
> +#define SHPMSDATA_METADATA_SHIFT       8
> +#define SHPMSDATA_MODE_U       0
> +#define SHPMSDATA_MODE_S       1
> +
>  #define CSR_SSTATUS            0x100
>  #define CSR_SIE                        0x104
>  #define CSR_STVEC              0x105
> @@ -563,6 +654,8 @@
>  # define CSR_TOPEI     CSR_MTOPEI
>  # define CSR_TOPI      CSR_MTOPI
>
> +# define CSR_CTRCTL    CSR_MCTRCTL
> +
>  # define SR_IE         SR_MIE
>  # define SR_PIE                SR_MPIE
>  # define SR_PP         SR_MPP
> @@ -593,6 +686,8 @@
>  # define CSR_TOPEI     CSR_STOPEI
>  # define CSR_TOPI      CSR_STOPI
>
> +# define CSR_CTRCTL    CSR_SCTRCTL
> +
>  # define SR_IE         SR_SIE
>  # define SR_PIE                SR_SPIE
>  # define SR_PP         SR_SPP
> --
> 2.43.0
>

Otherwise, LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

