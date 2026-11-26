Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34F5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 04:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gnMBbfnC;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J7AAqDSe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=; b=gnMBbfnCQwWFWS
	Wtg9utrWMmTpTkFyy/ur6WgAkpm9gF5ggp/KzxyfKYV6zMmQSdlBsGdWMsAru6bgcTDJf0O7+sWne
	WRH3yeB8qHz6Iu+vdpO6XAn2JCBvN+gIT5pOd1BQV9UwA4GBWhV0tepji1/8k5+AysrEfrLfZn/V4
	jovfU7nU2KkOj2udkeOlv5BOVOsQuy6O4mJnrF7+WKsNSsLVjfVPl8q7gpVM27f3fKmVepXdCvvMf
	yCb88agl66SB/0Wc4+QpbtfSeANDlK5oZ7GIX7qX67AS8o0tJZz5X9bVZfN2xPCK5BVkh3qOtPPuF
	YhUHv336WtY25dp4r18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRTu-0000000C5jn-3Nxi;
	Thu, 26 Nov 2026 04:53:14 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRTr-0000000C5iP-0cLF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 04:53:13 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-55c7445cf85so1381001cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 20:53:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795668788; cv=none;
        d=google.com; s=arc-20260327;
        b=FTzorun7eJKnAQ1E3csepyrxWyf4xw5zjKj8C9yw62WuJdyIgJiocpcSoT6YUpLRMD
         SKBSQC2vLfx49YEkG6AfhzDVry23LzbIkMGJ5h2rccA3qAgns+uJ8JLXj7StlApEP2v5
         I8V/hbJor6qEVIDhKbfbM1ghwLjKeEUohC3d/MGKcYa+lFCEdRCKGecKLFjR+U//sS5+
         xLAf+ZsOk9sbmCRuZM0ZuoK0ObaC3kXkecEfuNO+4Yqhadq1wsrsKDfh0S7581Wk7HnI
         DvRrv1e+c2p0XMNjyXHhWCMdNAA2PWUVIqhwJECTuhwWOP6T/lqMOvWtrBvn3y7WPYbo
         AmZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        fh=nW4Axamb4VUGCiTaZhGb8Oc49Magt52u8LAF42pBZQI=;
        b=o+pw6qYrlYBAjs9+qF7bUVUSfyaNxq5cishlS5jYGQK2juyka90L05U+Al31sh7pPY
         JtJOr5TJnQ2DhwpgPZHvSFethICXN2GmnvrN/AkvWlFfiY6lgFLlFRzMGog6sLM87Wk/
         VOXfWK+d5qkRz77UdajVTz/hBqs2T+gFeCdR1bQHt2aB8VVr1J6HBExIAd7w39AkD1RM
         yWf8am921QfTrVa6MbxXTiaFSCyk4VXmdU2oKblU6FNOUiQM2MnHbL6sdM5xmhBT334n
         3DcVfHwbU6bnRByP/pfeeU1zthdWixF5pkUw3BIUF7mOhdTSOMMw0p2od+WrZs/793Sd
         VWJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795668788; x=1796273588; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=J7AAqDSeiFVjciwwmzJ6RWnxqsbMRXSYpEC95wyLWDBA1FDvWHJnoL58MQv2OgfcFn
         4AnTXcxeypIfw2kwYc4Cqo7GZIi9tJx5YUy3py4sGN3I+5ZIJdPwpRZsKaK6TQ7qc8g7
         mYX17fG3TSGUSwvavxoUTLFYH7FXp05j+OPObZ++xB8XrJcuae75QGYR7gCrljmymccn
         V7qkfSkA2IS6g4HMh1C5d7OyaqD9+dmV+ZDDS3yXXDwsXGWqNm6ILih+TVcpxdTi8xkt
         J6zoSNGrHl7MwBbLazMDt6K4zAlFTSXeIARtFZgTu91okWpK8PTnhVISPZR1bkYqd6q5
         SOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795668788; x=1796273588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Lt4WVagAGoPNQQ8sUuV+xbM6KmxoNVjHzW8jPpsfl4=;
        b=p7gdR+FN5L2BhNbWxxk/nR3Lf0Y1uWuAeejvyJO3TyFDyxF2AVs6NuLTJFK4AjUxhY
         IhuAVVh9SFAAmuP6MkpXFf7NBG1pn/BSHi2inKYivCzcHjxHgSC1RcPwws0HxqfRpJym
         jg+apgcHuEPakesJxDZGTsNBNbOHe7zr7A1fNXDCyqVymvFPvvd/OmH+SGWUsPeMwmEE
         tGW6CsVVWFfx65wCfcgzpl3zfUmw3QVDpJ1fRYRhuPvW0rvsMYwxSkEQ80svUL2Iiyio
         b5yjgxjyF0Xmk6EoqSh6El7k0evzf0TrkJna7mVpJJowm6qILznxlvxpbCObMAKZjDj1
         R7Wg==
X-Forwarded-Encrypted: i=1; AL+hErHJmEvUa3Alifj6Vu8lAjpYcvGyBre5Gbh2E4h9rSwETxYDW8CwRO1HuGdRoU9jqhNiFt2kGkGL0NsfZIOFwF3w@lists.infradead.org
X-Gm-Message-State: APuU4Z9hpF4eLtKvFJmbvzwPIDAICWOC8AUGhoKFKNg+IQcl1uBPK6Aw
	D9hk47sIFpXetPf/ABHY4GpuuZHrL9sgupn9axAji+V5QtlrlnbIQoal7cabikeKn3cTucHKeg9
	V2gMuHuWurPWTxTZfb1QSNvEX2KkFAEe7Bsdm5ErK
X-Gm-Gg: AZFdTZfcSK4R8knm+iHHBq6wbnZS14kEwNwj1gTFRYSMbOEMYd7ZfrRcVZCYXyE2Z16
	X8bLDDxM1PqzbAQUQWom9QBpc9PP6/YJFib8ToW2cCyYwGIYiaiawEbymwDz8Wp5JVrhQ/PuAuL
	BDaucQXwR0X+Yw20HGI7ZSuMhMusvVgqb3+v8w7vA1wRJtDiJZnTCcqwLgWUX6cBeyh8MQYE0Q4
	xHhsMGWkJAyolCZO6Mj1Zl+aT6s3vFK1VZYyqbSIj8n7qU7aLcCrlKMHFSkIGRH0gXX747oop/f
	EMN5TY1R6Xdd3y2tmfU8kPEIZWVcfI3IhDLoHvyMPhBeDFjR4VOErOWX3C8/cm3D5U9DsogdJDP
	7cuvfqbLMlYx6xFBQgzzRpmBwqeIREwHYGnFpfxnv9L2fURwmaCsuO3NJfA==
X-Received: by 2002:a05:622a:1e86:b0:536:3ee4:81cd with SMTP id
 d75a77b69052e-55d88127bafmr101738501cf.4.1795668787640; Wed, 25 Nov 2026
 20:53:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com> <DN4FM3TBOJ9T.2QOOL77P5HETO@garyguo.net>
 <20261125132225.00254c37@gandalf.local.home>
In-Reply-To: <20261125132225.00254c37@gandalf.local.home>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Nov 2026 20:52:56 -0800
X-Gm-Features: Aa3M54pMQmXw5Cgtc0EakW9NOiIZs8STgUuBigJfJMSZlzejGTE6XZMetCnzc-8
Message-ID: <CAP-5=fWkUW787c4dGx9rccucqD67dfRgwBB_SoCxFnfZXtXP-w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/30] unwind: Minimal DWARF CFI unwinding for user
 and kernel space
To: Steven Rostedt <rostedt@goodmis.org>, Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_205311_223042_EA1C4903 
X-CRM114-Status: GOOD (  13.52  )
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
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,T_PDS_OTHER_BAD_TLD,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 10:22=E2=80=AFAM Steven Rostedt <rostedt@goodmis.or=
g> wrote:
>
> On Wed, 25 Nov 2026 16:28:02 +0000
> "Gary Guo" <gary@garyguo.net> wrote:
>
> > A quick question: how do you plan to get this working on 32-bit ARM whi=
ch has
> > its own EHABI?
>
> Do we care? Isn't ARM 32 mostly deprecated at this moment? Or at least no=
t
> adding new features.

There has been recent work on both MIPS and Alpha for perf events, so
supporting ARM32 EHABI doesn't seem unreasonable. Devices like the
Raspberry Pi Zero W/WH, which use a 32-bit CPU are end-of-life in 2030
(according to https://endoflife.date/raspberry-pi ). It is
out-of-scope here, but extending the kernel and verification
infrastructure shouldn't be hard.

Thanks,
Ian

> -- Steve

