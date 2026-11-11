Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E584606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CCioJWwY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KbSg85df
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/wyfEDWWDuIr1slw1zxcxTDWKymMx6jtSpk7SY5bUAw=; b=CCioJWwYIbgPZn
	S5mGBatU5dB7QrH52CEQI5Iu/qbXUg5G7QfZoFW2vCR+GkyImh1n3HiPldUW7GWjwClvSVBj9NFOB
	C48dQ9XKykw8D93ykw496DM4tXAeOuFQa1qmHNO57FlnKvtmvjwlozVg78t9Pk27UPliW6pXSX1dE
	Dyy7a4BK7QcmNYUkUNoGVmkWCp8HF9r/Ow1RBw8gym3e8JBzXEipaH7/ehreKUjjnDzGivkzIjwBO
	lg7clQwBZFgGWKQEyqpqwYSa+F6hjja9fGtU9mDNmaW9c7+XX/8cgbnLuOh6rY7+WpnatOvbX9Oce
	N5gEPG1vmrguk6EorkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4eK-00000006BPK-3iFV;
	Wed, 11 Nov 2026 09:29:48 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4eD-00000006BNC-0WB6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:29:47 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-491aaed7565so1770845f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 01:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794389378; x=1794994178; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/wyfEDWWDuIr1slw1zxcxTDWKymMx6jtSpk7SY5bUAw=;
        b=KbSg85dfQQmw4sm0GlBCcB5zNpoGfG7DOoaTmX87yDHUMhvAT4ZcwghI2J6fVsiwN3
         nQu+u+J5EjXm/WNuIe5lPy8GgDFggn4xVWcQn/Svg+hxpiBZnlhGEgPTetM1QyBVlExx
         esLKiepoSt7HEResH5CaGtOti9WX3fT01xKMENrMbt7ZT4nPBOuTbuVM9G3kEQ173+1P
         hpTqi+LO8UY7MWe3agCxz9/YTB8MLF1ZRTNyq0+USwekZwIVy5v/nTctKYrAw1etIrXm
         qmz8YcP4aGzEtafvwR4aD62uwCOo33Wlpy9X1PirbLceLuc7TWJLrdA6C+ydB85TMsfd
         Di4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389378; x=1794994178;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wyfEDWWDuIr1slw1zxcxTDWKymMx6jtSpk7SY5bUAw=;
        b=jpvTmLXiSXSvwXOtaCxq9H+Mh0bbzkgtjxzqD2+hhWWB03tYujZZMuJFjRMN5BSvki
         XpLP6L/MSB8T+8oRhxotqBeyzXRbbblJPFj5oq4L56+dSOB3zj5lmf4KiAttpBmW2+es
         ZGent3HZwVJ9UBBCY+lT33ZxXoa8if9gD+8IORDJrL2p0xjlFS1YjjGJb9lUf13fqt5a
         DQ/nj7Ev0HhsGENe4JYCgqLuJsc4KiESViGKEJytMZFyaQndreynRj9XZ+g6kw5T9DQK
         3pyOVoW4wcqekH5wkzqbU9oYYAbUOXsQpu9EFM5EVDCGYi28BSYYps9KuBuNIBC9a7ts
         OpXg==
X-Forwarded-Encrypted: i=1; AL+hErGRrKIun9QyYiXGhmBWCLavLlfTk9EvRq95NlJC+F2qIvSomfJFxhEpLICCHUmQ/NjdDcGo50YrKKn2khY66hsy@lists.infradead.org
X-Gm-Message-State: APuU4Z9cuFtZptCba7ALOzS46rPS8dyK5is6APFur4AIcRXPFxri+Yvi
	2cC3L+42lYh3hrCrfkUGzuAM7dTS90ELIloAvC6xrpKs0JLtgVFx29gV
X-Gm-Gg: AYBFou2TNu5S1swsTlwiOo9mO4HnJBA5/sl4f2ehtqICNmm+nosIu9m/cPekgN82T90
	yNNhIMxIy0hkAhc/INCOwKVb/eHlbNfp4GhzMQv3cfHMEwNhA86SMZSz2oMwN+xAxh/BK0v0hyW
	7ehFY8VnJ5h+3XdNCvUEnY0C9Gp/Btgw72qjyO/tFPfrTXfBIsRZ4xNB0K0EMMJzHjmuygQNeTM
	b+/Twq7TWl+90TebcC4YfkwN8BBWcMLDw3VLkmkY0kVhw0IoK7xADr+CTkP/c8PgYyJv7+Goq8z
	6iRqEZ1g281xw/e7Z6wSwJpA49nkEmCGMoEQ116UwoK1ch+ytXEHRSbpzRyxqVNxeqlAgOa8kmN
	pvwRw4tyrN+/IRfasv4kpGe+dj3HITFGgKyOGPMnFLIU0DWiov5LJOPM+j7oXkwtLQRGd3EOFeY
	8Gk3sTES96n+03tJp4Kb400cM+ZzjlL9IVXIEuXHssrYIYHcgu18NcOpZqHeiKww2BE9yklpjVQ
	H4rxdSvEtsk6UVvXgbwccyP0RHfEQwkUbujm0ylJ6A1u7KrO9jr4B2U8vWHW33U6kAg55/D43qx
	Lw7TWDrvOpOx+SEK8xINfCvoEx6C6sQzDCnClEVTrzWjX1p3ZCYI+vVWgb39C6iHoQ==
X-Received: by 2002:a05:6000:4011:b0:492:e1a6:90f9 with SMTP id ffacd0b85a97d-499c72712e8mr3087990f8f.18.1794389377659;
        Wed, 11 Nov 2026 01:29:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585923bsm10160123f8f.11.2026.11.11.01.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:29:36 -0800 (PST)
Date: Wed, 11 Nov 2026 09:29:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Rui Qi" <qirui.001@bytedance.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>, <will@kernel.org>,
 <mark.rutland@arm.com>, <ardb@kernel.org>, <song@kernel.org>,
 <dylanbhatch@google.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH 2/3] arm64: patching: Fix instruction byte order in
 aarch64_insn_set()
Message-ID: <20261111092935.4d6060ee@pumpkin>
In-Reply-To: <3b540bc9-69b3-42a8-8431-75dd6079bf4f@bytedance.com>
References: <20261010084721.2197683-1-qirui.001@bytedance.com>
	<20261010085055.2200241-1-qirui.001@bytedance.com>
	<atEGBsR3eI3cXKay@arm.com>
	<3b540bc9-69b3-42a8-8431-75dd6079bf4f@bytedance.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_012941_189089_0C1A1561 
X-CRM114-Status: GOOD (  22.66  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 11 Nov 2026 14:52:44 +0800
"Rui Qi" <qirui.001@bytedance.com> wrote:

> On 10/16/26 12:57 AM, Catalin Marinas wrote:
> > On Sat, Oct 10, 2026 at 04:50:54PM +0800, Rui Qi wrote:  
> >> aarch64_insn_set() passes the host-endian u32 instruction straight to
> >> text_poke_memset(), which memset32()'s it into memory in host byte order.
> >> AArch64 instructions must be little-endian in memory, so on a big-endian
> >> kernel the written bytes are reversed and the CPU takes an UNDEFINED
> >> instruction exception when fetching them.  The sibling aarch64_insn_write()
> >> already converts with cpu_to_le32(); aarch64_insn_set() does not.
> >>
> >> This is reachable in-tree: bpf_arch_text_invalidate() fills freed JIT
> >> regions with AARCH64_BREAK_FAULT through aarch64_insn_set(), and arm64
> >> selects HAVE_EBPF_JIT without a big-endian guard, so the path is taken on
> >> BE kernels with BPF JIT.  The direct-fill loop in the same file already
> >> cpu_to_le32()'s the constant, confirming the expected byte order.
> >>
> >> Convert the instruction to little-endian before the memset, mirroring
> >> aarch64_insn_write().  On LE the conversion is a no-op, so behaviour is
> >> unchanged.  
> > 
> > We are just about to remove big-endian support (in 7.4).
> >   
> 
> Understood.  In -next arm64 no longer has a config CPU_BIG_ENDIAN and
> nothing selects it, so 1/3 and 2/3 are fixing a configuration that no
> longer exists.  I'll drop both.

Should it still be fixed in the LTS kernels?
(or disable BPF JIT for arm BE)

David

> 
> 3/3 ("arm64: module: Use text-poke for late PLT/veneer emission") is
> independent of the byte-order work: it routes
> module_emit_plt_entry() / module_emit_veneer_for_adrp() through
> aarch64_insn_copy() so a late livepatch relocation that falls back to
> PLT emission does not write into the ROX .plt and Data Abort.  That
> path is reachable on LE today (klp_write_section_relocs() on a
> MODULE_STATE_LIVE patch module), so it is not BE-specific; it carries
> Fixes: 91b89a634487 and Cc: stable.
> 
> I'll resend 3/3 as a standalone patch in a new thread.  Happy to route
> it a particular way if you'd prefer.
> 


