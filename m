Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA8D60A262B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rjSYcwip;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=FBWA+95+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=; b=rjSYcwipsGqx2Y
	kSmzm1utq224eu7zaX2Hz+PS5ofd4EdFffNGEVyTJQW9VG1N15pGuHlWEVJiC5w1xTF6wcGNg3ADD
	Q2qv+KgSPb8JgZwWAGpPhytGzHg/efzV045mMJ5rzeNJm1INbD0ID6EJeXxMGaA6DvV6lAEZH0mKR
	7JokWhuSbD88F82Xb4NEZDUU+xW/LcCtRddgSTqDgRvItegO4E0LrPe2mvHqT8PezErYeH3ZCgvgp
	UgQUcndJFp51X/e1Aotq2cNuYN0cUjphirVEGIgrK86HCiRrjQVbwlWe45XPqT+Eh7PvCLZQo2UpW
	U6kzOUe1wf2eQFuMg8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4DN-0000000CVCB-0edr;
	Thu, 19 Nov 2026 15:38:21 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4DH-0000000CVAu-10L9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:38:16 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48dee593f18so2386018f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 07:38:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795102693; cv=none;
        d=google.com; s=arc-20260327;
        b=Ve4dHG5Ra4bP8SuAi8mOwrcGFDf3Fif+ZK8h4b6xLpDzEXHwjkCGigJw1mRtMo0v73
         kSFMqgyLS7gMo81Q0k6Bq5pLedt2jL/PF4SkylkXe2Zic7/S2FsjdV2uDM0MqtDxwHp6
         ZtboT2DuIq1tLLfjyNRAc7ihM4yCmd9dejROxqtrcubfc4TiqwUZPOUEqpQVZY0KSxww
         6Land2Gf1bCXFSKiR6EsPM8y38TKMbnIWqHX99LIfKMa0iKRIrjdnTWnyPogstPxqVQg
         TpJRcxW720k060HCTSJUlfuX+8bWveZNRXeJH96IUmwpeAzwuLoCH4ZE57w1eZrwcH+s
         dFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
        fh=LEkltJwd9/nib4I4N/pw84mAlD2H/ChO4ZWLmS/oLVw=;
        b=TpoeO5uDcfCzkviYa67rmTq2/B/brZUdUYrZFryKapzIo7HINwpQVUL8QwtzPU7Trx
         qj8tNPDuWPWtMwT/DMKfvGsfClkFVhEg1iZTJw2FLJACYxHME7yYnnwpRICtkMwwpFlr
         XYu92WPPbtTeeRTTzcJ74DTAbx42DIHJVQ+nqVZs+S2J/s/hfeceW4Bkxqv9fthEZDIM
         aODkolr9KRIuLG8osMOwYAaYpqda+a34mhCLXOlq5LdEOYZ+NZ5mlhIdDbG7dYB89PSJ
         PJ9kY7Dn3FT2QnDIjSUG1PvBnjDeNteCNoGokD03Z04Y+OVdrYZ7E/Y0pCTmk4V0JSSR
         pbsA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795102693; x=1795707493; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
        b=FBWA+95+6gSQSbg+9a54rHm3J5N2gmMQ3SjlnojzwwFh1yWKRKjEWjytlhNTeooKaO
         QMVPmocX3CL9ZqGM/qGtllEYc0z8+bcsdtI0GLUVWR98thmGTm2nqVgKTCkkdDTz1PWt
         rA2sz0XXt6NH+rNEpNM6brW33rqZH4mxM6NKbpGufFrCOLChhv4cc/1qX1cmrEUn23PO
         2/AmI2EdQWX/Qox6U/3ll84EhP0HObUDz0DzbudAzF8MUEO2l2zNly3kWOJOupKH4kQU
         jtC4CMpY7s99Khhmo/TeEPqfypMQRJXJtzS8PUzsVCvpuKknvWgVK4VU33LeX1dAcD2l
         49eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102693; x=1795707493;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drywv9X/QD6GTy9pDjLa5PABODeuHIP48aMyKh24UjM=;
        b=EP0LdroVKxQgoBXCCl4V1dHZFlmylojv4vRR2KsC2ZsP036XzsdE+wVeyszlPnmiCL
         Sz1SIxIC6EfCUuPLm4mrOMa1H1WMC0a2jhcaRVHZ+LpZBGwY+Cy12I4etPSGT/bwxuix
         lbC5cbExKpw82gqIxo0IU/WfgofbCjP+0Znq5up/usJZIBqQxnG+toVgsbu7CpDKToNZ
         E3rGT1ZZmltV3mmDW5bTqBBmizRhqXVtsyKfi07XQtrZwWFHqJcILXdCJ75p7JNLA4Rq
         xdk7SrfUbnQIkEoavrXJ73atQAbDYBXuWym9/ij2KtCpV+MQu4HqN8Sqq/jU3Hc5DQhk
         C4Bw==
X-Forwarded-Encrypted: i=1; AL+hErF1atbqy+JhtmSdCwehLS1ynmrme2BM/f9IMvsPwaK3VYTeEXuzdrpW2QlBjXjoKc/wLu/E07Btxb0AriOVv28q@lists.infradead.org
X-Gm-Message-State: APuU4Z9nIh606ahackeQFYhEwX4lY1snomaVw1HbGiZ5TIlvcuqlezuY
	dDIi/eTEdzLlBIIqyyXHw6YIvDAopQugunolc5UMZrviWLAw/ja/ITT+vyLo0zx1M46Wq7es96h
	7CywBsnJwdRQ3MO/Fn0Xah5izjAbwFBu6oYOwQoc/Aw==
X-Gm-Gg: AZFdTZd2IkNMCqBk/6ViK0nQKrHEoZ/M9rH9UnR0gTCMIJTFzvt0XBFjZ5RrMz0j3jE
	tjPn8F3yga6hWelKlsLPPfpPOG7Xy/qpUTmPy4sZh/qP1h1SRFtW0SwChTTInZyWCU5g7Byv53Z
	bQDoV2shDGU/86C7m3g45nJSfBU3IT+1f9FWwkX0atRQZiJgv5oz2/0mkFUHAo2ARz48UMyO1w+
	IsPwfubLUxhRYchYAdkt2XWXyVdf0xkUCn5CXqm4ztdIxEROxMuXyKjbOKaW3iVJZJjNhDXJc+b
	nqavaheXtS9mzTl6cuDJ7j2TAZS7jAyR1ue5JIXRvJWbVTdz6j/vhBsmDZ1V851bHSMjY3U89Z1
	PQgYuweiVHv+V2F6qrExhpDGV6Q6E04LW9lr/4W8OyWpyLCcI8BgJw/Yu2EO+kfMz1KOjjPPnkI
	hFYQxXiMfWkUAh39UaHrZdbasZbFvIB7/nSrcSyydy6p+J8ts8ft8cQYYb
X-Received: by 2002:adf:e009:0:20b0:490:1881:80ec with SMTP id
 ffacd0b85a97d-4a63a895742mr10073341f8f.36.1795102692730; Thu, 19 Nov 2026
 07:38:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118095053.3871267-1-vikram.singh3@oss.qualcomm.com> <20261118095053.3871267-8-vikram.singh3@oss.qualcomm.com>
In-Reply-To: <20261118095053.3871267-8-vikram.singh3@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 21:08:01 +0530
X-Gm-Features: Aa3M54qqVopLHoNkItX81APze_rfhpoAK0QlJ8DY6gdjSieSVn8liCJp7Smx0no
Message-ID: <CAAhSdy3KUqSqERnw6khG13mXKcaCf3UeG+FqQAZzeeNZ7S7GfQ@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] dt-bindings: riscv: add Sxctr ISA extension description
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
X-CRM114-CacheID: sfid-20261119_073815_504050_C5C1F102 
X-CRM114-Status: GOOD (  16.67  )
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
> Add the S[m|s]ctr ISA extension description.
>
> Co-developed-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
> Signed-off-by: Vikram Singh <vikram.singh3@oss.qualcomm.com>
> Link: https://lore.kernel.org/r/20261106173942.3175069-8-vikram.singh3@os=
s.qualcomm.com
> Signed-off-by: Anup Patel <anup@brainfault.org>

As mentioned in PATCH1, drop the "Link:" and the subsequent
"Signed-off-by:" lines.

> ---
>  .../devicetree/bindings/riscv/extensions.yaml | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 79491ef8f86a..dde2f28cfda5 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -202,6 +202,13 @@ properties:
>              mechanism in M-mode as ratified in the 20240326 version of t=
he
>              privileged ISA specification.
>
> +        - const: smctr
> +          description: |
> +            The standard Smctr supervisor-level extension for the machin=
e mode
> +            to enable recording limited branch history in a register-acc=
essible
> +            internal core storage as ratified at commit 9c87013 ("Merge =
pull
> +            request #44 from riscv/issue-42-fix") of riscv-control-trans=
fer-records.
> +
>          - const: smmpm
>            description: |
>              The standard Smmpm extension for M-mode pointer masking as
> @@ -263,6 +270,13 @@ properties:
>              mechanism in S-mode as ratified in the 20240326 version of t=
he
>              privileged ISA specification.
>
> +        - const: ssctr
> +          description: |
> +            The standard Ssctr supervisor-level extension for recording =
limited
> +            branch history in a register-accessible internal core storag=
e as
> +            ratified at commit 9c87013 ("Merge pull request #44 from
> +            riscv/issue-42-fix") of riscv-control-transfer-records.
> +
>          - const: ssnpm
>            description: |
>              The standard Ssnpm extension for next-mode pointer masking a=
s
> @@ -1189,6 +1203,21 @@ properties:
>              - contains:
>                  const: zicntr
>
> +      # Smctr depends on Sscsrind
> +      - if:
> +          contains:
> +            const: smctr
> +        then:
> +          contains:
> +            const: sscsrind
> +      # Ssctr depends on Sscsrind
> +      - if:
> +          contains:
> +            const: ssctr
> +        then:
> +          contains:
> +            const: sscsrind
> +
>  allOf:
>    # Zcf extension does not exist on rv64
>    - if:
> --
> 2.43.0
>

Otherwise, LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

