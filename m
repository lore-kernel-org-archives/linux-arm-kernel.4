Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB11460A2601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bzKmwKNI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sOqHfWUs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Content-Type:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=quIws+psUpfT5p+xm1gGt2RDyS2F35dMxJn1L0LbaMY=; b=bzKmwKNI06fao0L7uoHDdt0Z2a
	VbZVw+5oROxwdbd4/Xka186TcBJ4UdXpeRQq5Pet6v5xR56uL1Q84ZLwVWI6ri8iNcWjCzdFoXLiX
	4RSlhTeLi6+fJZZVrcvCBIk87Xu9uXToWH7C0lFbNZx3EAgM2IWJnWyD+613UC3HbFan7ybBFvUC0
	32ANZv8eludoM4tL0DDZl54y41k6uDM0BwVonkPycxC+hRaD9ZmuFCutZ5cXiuPWZiM7YqlJfbYTs
	D7lPqTFPvNkEcs2knGh4cXHqIjUOyV7CkGx8mbHRi4CAhf86LXL18jD1lLbYcdaYPgKXlqWLJKpAG
	UgfupQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU2G-0000000G1nc-1VJR;
	Fri, 20 Nov 2026 19:12:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU2A-0000000G1mu-1wOj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:12:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2f03eeda984so6861255ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795201950; x=1795806750; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quIws+psUpfT5p+xm1gGt2RDyS2F35dMxJn1L0LbaMY=;
        b=sOqHfWUsDLcYxiWaio07yxWB/gfDSrij6kFn97r16sKtYGpPTpzGK+vn1jLmhGgkvs
         HUVPj877cnq3UQomyySviqhS79TJ2JfXZWVh0CNBXCyedTzNtNMpCdrCJ+PmhJvVyiu9
         dcRwcxMGPCa5q11hWPwlniKKMMyuTCpfHt4RpT5DXyrnMuneo44S755cvOD/JHaerQTG
         3vVl7Po/fH4k8h1ygdXfzF/J/YMZtaWsGdrMRy1lzPYmAK3JI4dPF7xJYacYvU/fzG7m
         CM0eZF9OW7B605jQGbnjARoR1MLNuBa6R2P6CdI51yTU7+QLMJ7CwEmTZbtV9vWScS4z
         hVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201950; x=1795806750;
        h=mime-version:content-transfer-encoding:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quIws+psUpfT5p+xm1gGt2RDyS2F35dMxJn1L0LbaMY=;
        b=Fdb+tlUgy/uVL8weZWcWh8PK602yWhmbGTh5dIAmRYyR7pAPVxxhwamKAjmmgOVULp
         ZIpb0y20uIWVXtWAWD+5WXgFB3pqXMuTZT5fnC+ft5d221QorngH7sY3JADXr+xq7RuX
         eoDDljn8xwLxWuXsfBVRWEbA4jcBwURLefe6S81EmnH+4v9chhc5u87hsI71r11oRiZ3
         rdzte8oUhg2XON557Ocxud+g1MJDcUjKa2SMuyYIorvrlNzjJMsmGzID3XXpLXffmjCs
         z8FknYQCPRcS51yDU2LGewcOMZfMcWm7xyy5n1pW3oX8HT/V2bD4ynzSMF5g0edwJmfW
         6c9g==
X-Forwarded-Encrypted: i=1; AL+hErE38nvSHHvopJoW+MRx2r/SJmG3IFz8z5a0TBSLchG055k8+yzxaqnLv2FJiAQPm9iZenrKgy25fyX4FEiwornf@lists.infradead.org
X-Gm-Message-State: APuU4Z8YaDDMozqCSBA/9VmuZgwa/WuknVL7OAp10cXP8L02ITicXSlU
	BfpNt+8xitbfUCM5zEt7oIjysn0HL7Amot/FTPrXW3e0Fsz5vZ3mOP0k
X-Gm-Gg: AZFdTZfAKGqYfW4n2vhxqms0QM2/JIMbA8ikfW7KbJHwIDNS/TmNloKcnnN8a5CZiwk
	t8PbFH7f1OkI5C8HygWEKCM46fLbt1lAfsJ97aQmG4xxv9i7j9Mx1CaxJEvIgLthSEX/MjH4aF1
	zFsApkg/hsyMQHorsjOjxegDLxMtRPiIrjumhYepd7RNKUuOBODqKkx85AOtZbwE65e7Dfqfe+v
	MRiAxNNZ0agsFNLqFyKanJXtNRsZRaujly0CWPVAjJ7ww9rTw5cyHnerflWa2HoeeortdssklFK
	8PwboGQNCwkVuOpJY+eWr9S/WqN79Jrnh32kfNELYc9NhFD+4eB3R5ph163atW7r76y3wj19w4i
	AYlw1SiX8p+r7pQJyvQMnIq+saXIxDBfdiGQVhsHNgO/keU79fhZm6wXF/lKCMLBMmXjqFLN2wt
	vVAEfeTEHljCoEvngNQc5nECc4YJ4dRW6GJ2orcyc3XOEOrLJ6+ewO31lA5SUKtEUrgjpC0l6bp
	etBMye25202Toytt/7ctaoCqvPiWu25DutoPn7b0D+CH+LBbx2SROe7tASWoiPi+knHcfVSGqI9
	qzJB4hHiHK5AMKY25mtB1xaXkUqTdv3DX+ZLSzs5t5zEfI7DiPkUxpxtiabfkWlQkw8BWuNl0XZ
	AXIstnfpb0Spji0aPxgTqdW6aHMaWpB2IXoM=
X-Received: by 2002:a17:903:41c2:b0:2ed:2b43:483c with SMTP id d9443c01a7336-2f03f1bff81mr46388825ad.38.1795201949460;
        Fri, 20 Nov 2026 11:12:29 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1058fesm18914595ad.48.2026.11.20.11.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:12:29 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 19:12:28 +0000
Message-Id: <DN09ZA2KX6CC.UVO7HNJWT0EO@gmail.com>
To: "Ramin Moussavi" <ramin.moussavi@yacoub.de>, "Russell King"
 <linux@armlinux.org.uk>, "Puranjay Mohan" <puranjay@kernel.org>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v2] bpf, arm32: build constants inline instead
 of using a literal pool
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
In-Reply-To: <20261120140147.166934-1-ramin.moussavi@yacoub.de>
References: <20261111121621.665533-1-ramin.moussavi@yacoub.de> <20261120140147.166934-1-ramin.moussavi@yacoub.de>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_111234_708123_E4458474 
X-CRM114-Status: GOOD (  18.69  )
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

On Fri, Nov 20, 2026 at 06:01 AM Ramin Moussavi <ramin.moussavi@yacoub.de> wrote:
> Commit 0b59d8806a31 ("ARM: net: delegate filter to kernel interpreter
> when imm_offset() return value can't fit into 12bits.") handles that by
> setting FLAG_IMM_OVERFLOW and dropping the whole program to the
> interpreter, and already noted that multiple pools "would better be done
> as a feature instead of fix".

Not always. imm is u16 in imm_offset():

	imm = offset - (8 + ctx->idx * 4);

	if (imm & ~0xfff) {

Take a classic filter that starts with 'div #3'.
Put 64 KB of code without hard constants after it:

  offset - (8 + ctx->idx * 4)   0x10008
  imm                           0x8, the check passes
  ldr ip, [pc, #8]              loads an insn, not jit_udiv32
  blx ip                        jumps to the value of that insn

So the patch fixes a crash too.
Pls say that in the log and add a Fixes tag for 0b59d8806a31.

> ARMv7 and later are unaffected, the MOVW/MOVT path is unchanged.

Only when the kernel is built without v6.
The v6 line wins in arch/arm/Makefile:

	cpp-$(CONFIG_CPU_32v7)		:=-D__LINUX_ARM_ARCH__=7
	cpp-$(CONFIG_CPU_32v6)		:=-D__LINUX_ARM_ARCH__=6

imx_v6_v7_defconfig and omap2plus_defconfig enable both.
With the JIT on, an i.MX6 runs the new code. Pls fix the log.

> +	for (shift = 0; shift < 32; shift += 8) {
> +		u32 part = val & (0xffU << shift);
> +
> +		if (!part)
> +			continue;
> +		if (first)
> +			emit(ARM_MOV_I(rd, imm8m(part)), ctx);
> +		else
> +			emit(ARM_ORR_I(rd, rd, imm8m(part)), ctx);
> +		first = false;
> +	}
> +	if (first)
> +		emit(ARM_MOV_I(rd, 0), ctx);

The log says that arm64 does the same. Not for small negative values.
arm64 emits one MOVN. Here they get the longest sequence.
For 'r2 += -264' val is 0xfffffef8 and ~val is 0x107, not an imm8m:

  version      insns for 0xfffffef8
  -----------  ---------------------------------
  today        ldr r8, [pc, #off]
  patch        mov, orr, orr, orr
  diff below   mvn r8, #0x7; bic r8, r8, #0x100

The last 'if (first)' is dead code.
emit_mov_i() is the only caller and imm8m(0) is 0.

Here is emit_mov_i_no8m() on top of your patch. I didn't compile it:

diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
index 58d066a..28a2c5e 100644
--- a/arch/arm/net/bpf_jit_32.c
+++ b/arch/arm/net/bpf_jit_32.c
@@ -411,30 +411,30 @@ static inline void emit_mov_i_no8m(const u8 rd, u32 val, struct jit_ctx *ctx)
 {
 #if __LINUX_ARM_ARCH__ < 7
 	/*
-	 * A single MVN if the inverted value is an imm8m, else one
-	 * MOV/ORR per non-zero byte -- a byte is always an imm8m.
+	 * A single MVN if the inverted value is an imm8m. Else MOV + ORR set
+	 * the bytes of val, or MVN + BIC clear the bytes of ~val.
 	 */
+	u32 op = ARM_MOV_I(rd, 0), next = ARM_ORR_I(rd, rd, 0);
 	int imm12 = imm8m(~val);
 	unsigned int shift;
-	bool first = true;
 
 	if (imm12 >= 0) {
 		emit(ARM_MVN_I(rd, imm12), ctx);
 		return;
 	}
+	if (val >= 0xffff0000) {
+		op = ARM_MVN_I(rd, 0);
+		next = ARM_BIC_I(rd, rd, 0);
+		val = ~val;
+	}
 	for (shift = 0; shift < 32; shift += 8) {
 		u32 part = val & (0xffU << shift);
 
 		if (!part)
 			continue;
-		if (first)
-			emit(ARM_MOV_I(rd, imm8m(part)), ctx);
-		else
-			emit(ARM_ORR_I(rd, rd, imm8m(part)), ctx);
-		first = false;
+		emit(op | imm8m(part), ctx);
+		op = next;
 	}
-	if (first)
-		emit(ARM_MOV_I(rd, 0), ctx);
 #else
 	emit(ARM_MOVW(rd, val & 0xffff), ctx);
 	if (val > 0xffff)

pw-bot: cr

