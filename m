Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE27606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 07:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FhqU5aOZ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tugbffd1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Date:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=i0sztYeDoa78GRxByi5DPGRDZ13zK/I8mczcB1W5Z+o=; b=FhqU5aOZWh/Le3
	xNANeiy2sjTa1/H/jDLxi27N6gmGeoB7n20EraY3Z5JgU2Tct7hIhi7eEexBpvbBqZjqg5RDasspW
	lN7iS3UY88dSYSib6+7xK3hXX8McMEcYIjLgZ0Zi96kH9h9qVz8lT6LJdax4/OgjRZ6U0qPzaDjyp
	jOSAX5IGJ4i0v6dNjSsTCQLjs8UX8z9Xrd1y01Ag1TytLqWXHK2eFB0ofbCrPtFwR4SQO2D4fqehj
	una2oBjUku87L5utzuRNnxaaTIH9LMsSgvmxYNU5/TsIPm1D5WDJZxg73NapTSw6/TucTlFN3G//T
	WeYCLeFRndgP1iQMwRLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUQh-0000000H9ip-38JU;
	Sun, 15 Nov 2026 07:13:35 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUQe-0000000H9i9-39dh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 07:13:34 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-15dd124bbe7so2378239c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 23:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794726811; x=1795331611; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0sztYeDoa78GRxByi5DPGRDZ13zK/I8mczcB1W5Z+o=;
        b=Tugbffd12bDzpzufplR7lc6K7Rrb/Y8q95QPFSIwNd8gSK00dh01F5LP9OkvPWMpZT
         ZRozise/c7Bh6abpa8bESo9ek3zPif/bCKsRL4m16QVsjCi+DsVRiwcAYMOMAAnIMREf
         H8WNRPer7icAL7sOxGTTEOtTAivqJK0dV5bmWkbUzHQfbVfPdYmomTwfrTJQ4RMaQiYu
         CxQhsk9rrZUWiWFI7i54rYaYzvSgi06SR4ldebBhVgZQY1PoQFx2SpgcUfFYNcdapzur
         uxWjEFY51lmzAzBPRc269dxA1Xi5YWtERLroA2hOtAk9YY+Gu0D/d4K0oFIogzTxwwb1
         4x3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794726811; x=1795331611;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0sztYeDoa78GRxByi5DPGRDZ13zK/I8mczcB1W5Z+o=;
        b=nHIZlMlNVnJttDWScVQUsGrqk7Yw2JJzXzpFsmyuYKBP6Mgv5zKYFZtjTuVaBPLSWW
         QrQ7BkrLnCZJeE9/LzfqGad4/4S5HejJ6mAF3wtd7VJ2cYeqwqDygpslufrswBWXHeCX
         qdciZ+e50jcnOV5dkLSxRgaFckBK/gwccRlcn3Ppu1KSLHEgR3NY3l8KtnYGIdHoexSn
         G9A7htWeXVlO291QIQpZr8gk0BAESmocFPUNEuFaeSlZstgnikq+MgtOV/TFZsgnDiYN
         JBaVse/Uh+8a8qB+VNJHHR2LHbHN7eT7xSR5gXN5qHNqDOWbX5qf0s7kG2uym4qPpUOa
         Bqsw==
X-Forwarded-Encrypted: i=1; AL+hErEE973Eb9cnKXqebpmDoEhO91I1Yp2tHCLoJk/W1aBC0b0ui/btegN+UVDIYUBUhMXqwj6TnvSnQWqTu9CntFeD@lists.infradead.org
X-Gm-Message-State: APuU4Z+4EzQASBe04xyseL6RuPnwuKRXJGHdxmitK8HJ00vd+hDyrjeS
	pFFH00SpFf8JQF5RKWph5wsXNyPLE7v1uulpo7AO1e506hPxyVCf5IZb
X-Gm-Gg: AYBFou0XLq4RPaf0bHuryOnIdwnV9KhIo4juTCbBHnbv/UdeaOSf3lwYVO7vNL3eAsI
	BsXVoIZU2+X329Hc1AxyVDR3M+8//yCpIrAIXQQ97Z+MwHpyV/bPEGPYStmDOURgcLRNcz0tMnz
	g24Qnm3alu28nGF6r33rF8qJlF72BROpCeCq5tQGGARoHLnM6Y+8wKGJmmkW1PxRW/ecjwoUuiR
	LMPD97arhgAyqMydtoY3QQ7Z5Fj7lidjP+3MbL26FQTk41nKVGa/a8KqaeA+Jga1Xu7MqYY3Gse
	QBtlmGFqDjFwS+Bc5WXoyFq7+OJvDnzilxs4Gi9uGM3c5NpmsXN91pnBBaM1zscZY/AhNbf2UY2
	351mP/R+/omxJ2j7FXh4d+zidWo2yO3Qi4VfG9usmqYlzL3ubM76+i3abslmuYc04rgpu+SQyVD
	bkgzReymbUNf+xzB7SwMZ6mC+X2mqFW7UHPVEKqFbHq6p754kbpouHkQjmMM2l97I7mUoywi6hr
	Q3mP520vc0RVRaqUGMw9uj9nDKePyDBLjUt6E+9KIM7HQBVRCcppvdhJw5jUxi6do8pFe4Giljv
	rlkA3k84c9EkfSrOySRndVt4buw=
X-Received: by 2002:a05:7300:6148:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-37967dd7e1dmr11471490eec.34.1794726811302;
        Sat, 14 Nov 2026 23:13:31 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm27441185eec.27.2026.11.14.23.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:13:30 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "David S.
 Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Donald
 Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, Heiko
 Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>,
 Liviu Dudau <liviu@dudau.co.uk>, Luis Chamberlain <mcgrof@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit
 <nadav.amit@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Peter
 Zijlstra <peterz@infradead.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell
 King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>, Song Liu
 <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v8 11/16] powerpc: extend execmem_params for kprobes allocations
In-Reply-To: <avlTdlK9ErlqVRYl@kernel.org>
Date: Sun, 15 Nov 2026 12:33:31 +0530
Message-ID: <4idi8tks.ritesh.list@gmail.com>
References: <20240505160628.2323363-1-rppt@kernel.org> <20240505160628.2323363-12-rppt@kernel.org> <3f7af771-87a7-4ae7-9919-bc4c23bd31c9@kernel.org> <avlTdlK9ErlqVRYl@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_231332_794204_5FDDB45B 
X-CRM114-Status: GOOD (  18.40  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Mike Rapoport <rppt@kernel.org> writes:

> Hi Christophe,
>
> On Fri, Nov 13, 2026 at 03:36:01PM +0100, Christophe Leroy (CS GROUP) wro=
te:
>> Hi Mike,
>>=20
>> Looks like I missed this change ...
>>=20

I didn't initially get what Christophe meant here. Then I came across this
reply of from him[1]. So looks like somehow between v3 to v8, something got
changed?=20

    On powerpc book3s/32, vmalloc space is not executable. Only modules=20
    space is executable. X/NX cannot be set on a per page basis, it can onl=
y=20
    be set on a 256 Mbytes segment basis.

    See commit c49643319715 ("powerpc/32s: Only leave NX unset on segments=
=20
    used for modules") and 6ca055322da8 ("powerpc/32s: Use dedicated segmen=
t=20
    for modules with STRICT_KERNEL_RWX") and 7bee31ad8e2f ("powerpc/32s: Fi=
x=20
    is_module_segment() when MODULES_VADDR is defined").

    So if your intention is still to have an executable kprobes, then you=20
    can't use vmalloc address space.

[1]: https://lore.kernel.org/all/1cb41761-29d0-5d33-b7c1-0ca3acaa810d@csgro=
up.eu/

>> Le 05/05/2024 =C3=A0 18:06, Mike Rapoport a =C3=A9crit=C2=A0:
>> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>> >=20
>> > powerpc overrides kprobes::alloc_insn_page() to remove writable
>> > permissions when STRICT_MODULE_RWX is on.
>> >=20
>> > Add definition of EXECMEM_KRPOBES to execmem_params to allow using the
>> > generic kprobes::alloc_insn_page() with the desired permissions.
>> >=20
>> > As powerpc uses breakpoint instructions to inject kprobes, it does not
>> > need to constrain kprobe allocations to the modules area and can use t=
he
>> > entire vmalloc address space.
>>=20
>> Using breakpoint means the segment must still be executable.
>> On book3s/32 VMALLOC segment is not executable, while module segment is.
>>=20
>> See commit 6ca055322da8 ("powerpc/32s: Use dedicated segment for modules
>> with STRICT_KERNEL_RWX")
>>=20
>> See report and fix at https://lore.kernel.org/all/ed03d290d440d579a81ae0=
b7de5243721291d903.1794543909.git.ritesh.list@gmail.com/
>
> I'll take a look, thanks!
>=20=20

Thanks Mike for taking a look. Sorry, I should have ccd'd you there, I
guess I missed it. However, the changes are these one here [2][3]

[2]: https://lore.kernel.org/linuxppc-dev/82c4973addebd82923c460cb44221f5b7=
6146afe.1794572365.git.ritesh.list@gmail.com/
[3]: https://lore.kernel.org/linuxppc-dev/f75f2cf97f44375fd2c8820e0caeab703=
cdb371c.1794572365.git.ritesh.list@gmail.com/

-ritesh


