Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2445A606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 01:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pB8ixAqR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xqvzk6Xl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:From:
	Message-Id:Date:Content-Type:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EISx+aUN2h8+Y5wGuLkSbChaUhZOj0j975QB4nl6i2Q=; b=pB8ixAqRqs5sKZ8Z3w7DgfF8jl
	tbrlKgEcFim3F6touisXONEnSywz6w0jIblVorSDsolNLMsiwzWSoeYnwnYfGJCyZee30Hk6DO3vD
	10F0RWO5mOKIL1+YPpkqUhK92GOEyUWJXtJgmx2Tc0Qpvm65l1oFBiZTBdb8//FnQNd/8JIe38rtO
	g+2BM3g2ZnGhTB42gIVfi3LxqKhVIFv676DgvSCHL4hRl1EEwBLtGOkPEBDAt+DOyUtA7vy5KxNd0
	rX9QqbGFimnX+AL3UduPEyl5SbmcR6pUnQ1TybZIrJfykOFQtttNcfNsd1CkcWhaAeUmA+2uMFDPR
	FKX7laMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTr6Y-0000000AdqA-37Pa;
	Thu, 19 Nov 2026 01:38:26 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTr6V-0000000Adpj-3wD3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 01:38:25 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so1042602a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 17:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795052303; x=1795657103; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EISx+aUN2h8+Y5wGuLkSbChaUhZOj0j975QB4nl6i2Q=;
        b=xqvzk6XlJNkhTQOB3GFjbCwNgXLkHuHsz63V81fUrZJmyz4nFh+SBaCivbMj3GAFHh
         xnMe+EESTxC3XZBivrFoYNOSqk7t/2cO/xENO6dvz9DYGGZnwsJtxDbQQmeRGk74za8S
         fzNfz2IH8Oh/aaS3dVDlA0oADUEIyI7YEdjs8F3d3wYuq8jaaBeRneEzqdM5FKpgPuaQ
         hv2qTSx/PvJQwzNp769+pX1DcwAJUWj9Mw5/OkxiBFa4tq9WWeIIHU6W87malzu8+D+h
         Jggjx92SZXibV1AJUo0MPgLq8Pz3KQDriI7o2y6fnvrC7cyD9KqSlm22TadLFLKw+Er5
         bagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052303; x=1795657103;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EISx+aUN2h8+Y5wGuLkSbChaUhZOj0j975QB4nl6i2Q=;
        b=Noc/97wgIlm82JATsegdC013O4maElNm+kEm6CxrIVHe6113HEWKJ3Ej3+akpgIAAf
         f0xxjmPr+dIm8M5bx+OIY5jboKFBx+He8ZplnZe10tMN0iwbF6gh+sS+HQ7G0LQXHG3g
         E/nOjAKsUSdbrXnv/xZjxHDI7OrMHNRIK11g2uaV4g4dWNkEOY+JZtkNFHrMbw0epojA
         Wbq3TTF2rrg3ohAa5N/qK29s6yF1UDtskji/zoYlVds8XYSJm6dWKy5jJRNxreTrr7jK
         HgFIJF4XUQTG8F0AzgqscLK23bAM0LluuOM0FZmB0quvNjBkq7ZQAxVWPcywriuqKvjt
         9iDg==
X-Forwarded-Encrypted: i=1; AL+hErFAYjFK9ALwtfFZ40H3x7QCzcnoZcCfvnHLBoSxGqIQE7ZHZ3i30NFJOLAO6+iz7iHL+yiM9b56mSxxR5x5wRQ5@lists.infradead.org
X-Gm-Message-State: APuU4Z+WjQ9S5L6MxPLOLcEi6vUibaV11dsydT1k5aiJ4ME/INw0E3hm
	Zd12efDnYCYVWLOB6bI99xnIcW3xmQIlBLkOzaXy8aWQfTwK4rq6dcEZ
X-Gm-Gg: AZFdTZduwipUMdzknBrGUJJAUPrVIEwrko0Wg+P7wFQFLFXGuZ+BrRb+iyPH6RP2ty5
	P8K21jjUmUAb3964tjWyIoA3MKHMX6r85cBR2rjklFhdf6pAnsxpyR41LZxEpQHXLn5wGbGcPwj
	19L/1AyGhv39Qz4Rc6mPAgXD+cahKeQLeCCb97Gv3lymrgK/xrazI3k+DnUe8b2iIN0llqONB86
	3gv/QRxI5dTFy7Tcqkg+bPdOMcNg4sYK+yizhi1xokBzXKekkDp2cl0rivp+BpcObom2VXi8fki
	y5IvLMJlaLY/bQQEXrom9EUeY1cKqtxz0eY1YHdcvBoe3cjAAMGHo0mY2HVLQ/CsAxAwG61UV4M
	W5Hzbq3MwOo8zQD9ebLpb8K2V/4gHJbQwsbKK+p7mkP6xwRNRFViNjhSmROtbPMs5fMaClLUJR0
	utw/NVuwZ5yWBe2vGnmvc0rPxdCp7OFV9tjffy8qu7jaMutv4UWF+Iwt8eiXrQHlRK258PtEnAF
	GLvpfFfSeP4lJiRT90bGU5Lmmm9abgQiRLQ5NCyFgS5UYkZ/0GFkTEdQYPJm0hTqERNy/kNvdw3
	lqp2Fm3cchP9H8QLi+BRz3d9+Bjkt5oySUBgIkBZPTGU+oo88PUAk4h0UHGhZ3+TtaMt8oCubBA
	XZmevkhiFeV0P5gI+CHJxHUnEq4oj3adE1w==
X-Received: by 2002:a17:90b:2890:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3b3d07b99a8mr3639797a91.32.1795052302815;
        Wed, 18 Nov 2026 17:38:22 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3fe0b62e7sm685981a91.11.2026.11.18.17.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:38:22 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 01:38:22 +0000
Message-Id: <DMYSXNCMOF26.38XGLPOW4K29X@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Andrii Nakryiko" <andrii@kernel.org>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
 <linux-perf-users@vger.kernel.org>, <peterz@infradead.org>,
 <jolsa@kernel.org>, <rostedt@goodmis.org>
Subject: Re: [PATCH bpf-next v2 1/3] arm64: perf: Don't report the caller
 twice in caller-regs callchains
In-Reply-To: <20261119000112.2377949-2-andrii@kernel.org>
References: <20261119000112.2377949-1-andrii@kernel.org> <20261119000112.2377949-2-andrii@kernel.org>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_173824_006803_3A5F5461 
X-CRM114-Status: GOOD (  14.27  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 04:01 PM Andrii Nakryiko <andrii@kernel.org> wrote:
> Do the same on arm64. Set pstate to PSR_MODE_EL1t, which exceptions
> taken from the kernel never have (the kernel runs in EL1h, or EL2h
> with VHE), and skip the leaf regs->pc in perf_callchain_kernel() for
> regs with that mode. The unwind still starts from regs, with the frame
> record at x29 walked by the unwinder.

my bot thinks the following will be a more accurate fix...

diff --git a/arch/arm64/include/asm/perf_event.h b/arch/arm64/include/asm/perf_event.h
index ee45b4e..7c5ab65 100644
--- a/arch/arm64/include/asm/perf_event.h
+++ b/arch/arm64/include/asm/perf_event.h
@@ -13,11 +13,12 @@
 #define perf_arch_bpf_user_pt_regs(regs) &regs->user_regs
 #endif
 
+/* PSR_MODE_EL1t marks these regs for kunwind_stack_walk() */
 #define perf_arch_fetch_caller_regs(regs, __ip) { \
 	(regs)->pc = (__ip);    \
 	(regs)->regs[29] = (unsigned long) __builtin_frame_address(0); \
 	(regs)->sp = current_stack_pointer; \
-	(regs)->pstate = PSR_MODE_EL1h;	\
+	(regs)->pstate = PSR_MODE_EL1t;	\
 }
 
 #endif
diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
index 3ebcf8c..de394ff 100644
--- a/arch/arm64/kernel/stacktrace.c
+++ b/arch/arm64/kernel/stacktrace.c
@@ -357,6 +357,13 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
 		if (task != current)
 			return -EINVAL;
 		kunwind_init_from_regs(&state, regs);
+		/*
+		 * With perf_arch_fetch_caller_regs() the PC is a copy of the
+		 * LR in the frame record at FP. Start from that record.
+		 */
+		if (processor_mode(regs) == PSR_MODE_EL1t &&
+		    kunwind_next(&state))
+			return -EINVAL;
 	} else if (task == current) {
 		kunwind_init_from_caller(&state);
 	} else {


