Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B730E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 01:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=16vpQtV5;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yA4Q4o4J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:References:In-Reply-To:To:From:Subject:Cc:
	Message-Id:Date:Content-Type:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IidocJDbGJXK47j+zgIJSmib9dFoFVHbL0vp9LH6UT4=; b=16vpQtV54KGsSK14QvKQaLwp0k
	io99YNoHS0MyVVhp4AqaOCJctEPeRd7wc6II6A5Jgop7LE1D4j2zjOYlwKjTI5X0bQ/W9rl0ETse7
	pfAMBHD3ApcWQbVXzL0hZ9V1rIGuJ0ZDc1Mxy6JFf8J9stp9fad4oAyVKQSy/+bDtxZ3gRoMpPMVo
	zlOVMgp8wPZHguWpPlqOZSZQOynksUfdi9Q9woM2AKEIKsGw1PjM/H648ssW2sMpLvtjcsbF3EEVH
	bdADyG6mISnPQjJ5wESbVrY/Gkb9ixgBP7mnR8WS4w3AhaSFC9i1XGkPOETgl6zHlbhxqjYU1SZXi
	IcVc2SJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTqmu-0000000AcUk-1hBu;
	Thu, 19 Nov 2026 01:18:08 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTqmr-0000000AcUO-1Odb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 01:18:06 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e96502e447so13803555ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 17:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795051084; x=1795655884; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IidocJDbGJXK47j+zgIJSmib9dFoFVHbL0vp9LH6UT4=;
        b=yA4Q4o4J8GMCBjD3MtBtEb+pN2PhoodhGg1I9llzQ/2bH6qnYhQGHMyGNnQ+9c0+pR
         28ao4dDxfEC09rRgBiipReJTyT1i5apWop1RlD5a9MNCclfeXYwu8YHKIZNal0h9PvqD
         6mAIf5NtoxkVxxD8tcZYHWINMQ5Vg3jX/blSYNf7i3feibSaagRNa7kZtxgG0OhKs9OC
         YQcyaHyFBheDuev1BIL03+8TLIOLkSfLK5HPnPWan55Uoqr9AwUDQp3lxH57ZqH2UILV
         3R7u7epW91JI/kYaBaCqOO7RxP0USkxFpe3ljtM476M9ynbker0v/wUoGqQ+4u2Ehl6j
         BRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051084; x=1795655884;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IidocJDbGJXK47j+zgIJSmib9dFoFVHbL0vp9LH6UT4=;
        b=jHenAmzDmO6Y63NM304+kaG9J5nrbau13Dq5xFS/bXDrm59vxkH4nC3VYunyDgRzGJ
         g95XmNsZ3JmtN+pTE7+TaZ1YHRDj1h4GqhwZPH8WXye/Q/u6rTqR/b/Ji2txqDaLFflC
         bPiArSAFLliTqGhwqDlYvgQIJUGP/6Yq8XcvSw6KbgeJbZuptDhxmy1DyduQYv5/5hd/
         uc0f3jvkpbXG/hFozM4ZdU6flMJJy2THgUnN/7xSma3qKWA23pLpelCEdAGwPmWZBre5
         zkZ5LSQTT6N5kJ4bHZ26FIXHS2DWYqrcVy6W+1LX9fnf44z6jlyw7VhCTEV3FIkezell
         t0wQ==
X-Gm-Message-State: APuU4Z8OunZxviWb8Td5HUBQyvXeBtKWORcXKBUmyXQX1CBFOYNsgD9W
	J+l7wQIrQbum731Ma45myqgDrZ1sRSTNzC7zs4FaY9IJG68HxEcm26Ea
X-Gm-Gg: AZFdTZf1t9B9evWoZYdDzqE17I3SvxGiSLrx35HLt2N+8uZcu50eVhPI5vGiMibrOPZ
	DvKU9Us6XfWsR5QmeWZM/vpvX+kMoZ7YUQCkaoxnqJE1MGucdv+cYqerPUUWef6BY0b6q6Z9uwb
	vbVNzoz4geONVbSJPB6PtIoKpm06PVAM9yV43kSvKglx0bNNb4vRz+sGcEjwa3wcrLDyVf+aySy
	7inusHkmnPjJ0QdiHcfDRbNcGDSHXbAiJ6Fl33p4X54VInWwzfd1phvn/ZW2Aen7j/+VYlmrhEc
	nRgbx3EIPo9x1PryB1YS6fcR+zHk0L8pU5f5co3jMdUb+FlVmncZwGaNBMHE5L3e3N97QNqUjir
	S2Tx/+XaLLposEW1ZhdPSPJocRd2zBDmuX3aaX0iEkIo2ygKPw1V7GQtkFbj0KpO8NZ/2d2CkGQ
	QL1klFFSpcRA1T0qImiHKxcO5kvcE4UcRkLqxGRl5jIUPvHm6QAimeT9QJQXESZ32aq+31Se9D4
	D7pdfusLOYZMbl5vEXlNP5+JFNgPOIVh9yZbZhOs8pk4fHG5i4xoLE4FjZpBRFXLfN2Ecq1grBa
	nkoFcveq6yuCL8SkYJbQH0j67Xdiy5I2V9TaAfJ9rEhDVrs4U1svu5aOdQWGtA+nO3aKn8uXc5m
	9xidQRWOXwteobLJQKsqAUySneC2U+nTtpQ==
X-Received: by 2002:a17:902:d489:b0:2f0:943:1178 with SMTP id d9443c01a7336-2f009440af6mr27265855ad.32.1795051083737;
        Wed, 18 Nov 2026 17:18:03 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6182330sm20533265ad.36.2026.11.18.17.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 17:18:03 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 01:18:03 +0000
Message-Id: <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ryan Roberts" <ryan.roberts@arm.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Mark Rutland"
 <mark.rutland@arm.com>, "Daniel Borkmann" <daniel@iogearbox.net>, "John
 Fastabend" <john.fastabend@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Alexander Viro" <viro@zeniv.linux.org.uk>
In-Reply-To: <20261117172341.3152407-1-ryan.roberts@arm.com>
References: <20261117172341.3152407-1-ryan.roberts@arm.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_171805_397694_977B3BD5 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

On Tue, Nov 17, 2026 at 09:23 AM Ryan Roberts <ryan.roberts@arm.com> wrote:
> The arm64 JIT implements BPF_NOSPEC with a speculation barrier, but the
> interpreter calls barrier_nospec(), which falls back to a no-op on
> arm64. Programs executed by the interpreter therefore lack the
> Spectre-v1 barriers assumed by the verifier. Contrary to the code
> comment, kernel-wide SSBD does not provide this protection, since it
> mitigates Spectre v4 rather than Spectre v1.

Nack.
In bpf-next arm64 has no interpreter when the JIT is built.


