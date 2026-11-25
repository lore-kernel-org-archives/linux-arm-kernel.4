Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3995606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 04:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aQ0K1t5C;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6KMuos1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GzNf16NNZkizHpuwga0Z0tMlnoHvbeUboIUcXI7KCTQ=; b=aQ0K1t5CQAEXsg
	0ELQCP6kUeGWkNLZrwhPi3x+PTvyCLpV98R7eMJf7zZeSwtEfHQ/Wzfqx4j3InKdaiJhsMc6NruvC
	/z1ME94CIxezyVpCtuS73qTa3QPKxdPKRUX3qopZDOSnqz8ejNDP7D7pSmzY3a+yR9ABQ/ADC8xZM
	z3EL0lR20+fv6sHvOt931SQSYxyK8XrDLRd3oF1BupUPbXJZn3zD6cNtzGe3R6c3LObbbDXCzmo1m
	056Ouns+MuimGd0a2KVa8+wIrgnxeuq9RiDMD6jnwruVIERYXT45FRbMmare62Gr4cGPTx/17tddw
	LZI585Lo+T5fkdcWD0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4yW-00000008QNA-0vJV;
	Wed, 25 Nov 2026 04:51:20 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4yU-00000008QMl-0KK3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 04:51:19 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso2104876a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 20:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795582277; x=1796187077; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GzNf16NNZkizHpuwga0Z0tMlnoHvbeUboIUcXI7KCTQ=;
        b=R6KMuos1dAgVE2Ia/hoU/HT8exdA8IixOM4k0DQMxBp27bLhvQMGoM7PsjUy/nMX3q
         4iME0vO6UthCBsy9iyJSfxgcjqi8ILK8OsT90PFT9ALdFZy9fxWPI2XnLK84+PjCeRsb
         KqYTX1JmwFRmIF8zlCu3vxIvzPhAfFVLRUXxB52oD9szPU2HAAKPvYNhThv8RMK0kmH/
         0s6fLVfHM/sqvMa4teRpUnE5UGl+s3cyLyzXh5RmZXqDVjsj/jU3WUTHr2E2L7Y4h8PC
         bGNeUL0X2ptqzdScH6gQUsX6wM1tD5UQhAku3kHXG1hOQPZoP+2rkxWrsA7H6PM7de+L
         OE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795582277; x=1796187077;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GzNf16NNZkizHpuwga0Z0tMlnoHvbeUboIUcXI7KCTQ=;
        b=tkxadbA8ab1NTicWrPKZdkUBGcqGYsCoAW4YHiv+mdBKudQPJELXJCLn0L7ecOxkkZ
         LGnRRZE8JWZLN5N500LiAYuKZxrEXaXJKVn7zq1PVYQFUp6xrhxIVpp1mH8wx3XsLapI
         9JD27FXk9N/E4s/5t2XJ2M7zATSMoPJSWTaA+mQjExX7Vc4mArsljrua6Y7jC91VMGTG
         NoDS3zp/ZdLC/ywLqo9m3WnhoMEcoYTg4azaAqz0EWdE31ULkL+0CU9azYmB76CpqSh9
         h12eBMFt83yvK5CSWTP33/UyYYcYzba8Tp1e/FAo+b1fCNlVgzISj86nRe9VZC8vLe8c
         acQQ==
X-Forwarded-Encrypted: i=1; AL+hErElLXW/jKnVZHqb4Y5pskdHgqc2eLIbo/Zs1T7vgSjoHk818nRLZB4d+Dg/mzfD5OoQLFErAUU/d45hsMvt7Dwm@lists.infradead.org
X-Gm-Message-State: APuU4Z9WXGpzR4nZGium//atDjhdIUpQgoWuLq+xlhH6Kpif7IumcevT
	xdYGXA7wRK4UPBREGgSlU12Yqr1nAb5pQlQc5N61oyZXoBJipTaYNZhK
X-Gm-Gg: AZFdTZdw2EkbQKDZ3npPXisHJXtKikENbyCYyGqXBFYEKi1yMhy/DIoqeo3BkGpjfcH
	tyovkncwKqVxRvItevxPokkFvyknobmXfz0y70OITgLu9TiDr8BA3qkrhTtHp661SpfhFgK4V2b
	HJenpAeskQAiJN0lw4tdPAe0ESkSapE0/6ejDlrBWhAABzKo8Vj7si0ZaWFzkIMGt2S8NgHyxY1
	aJLeLbvP9ZX29pVEgYeODZlvLnArlq94SIB4SuOEgZvw/yUj8cXyB3Zr3uG610fFjd9roDb5hvI
	CR9/MBiNfAQFEB02/d6+6t5tE/KAqpIl2xo7oEjJX9+Celaia3XzrVlhEfrN0cWY9jyePQSqtXE
	VOn21AaNr0yipFz+MK0HbKyymU/66pJ8yws2q7MjLIT3y1Mb+R1iZ+p+rKlZE7Jn3SRmEdccvPO
	Cu2lUyLbdxj6ZuvsM2f3XAPWX1+Wz2IQ7mlI1NmXvaQRLyHPe09BX7HJ6kFxxOJPJK2S6cjBQsy
	+/vFW3lHQJEUZqBkfr2rLfmxgy7DOHKY/pDqyE8LXKjMSu+ep8IHZrJ4H9+F8jqXUgxjj1GUgNV
	YQQnNzTVWnvzziw7VqVTxOdXw9csHYcqy5hDEQOD5yGOMMlNuPEKLKqerFfi/oEYCakUZbHK3Ko
	timqrPbc1XTf+KlpZTA6JQq+iWeLPehCSXbqNfVMFYf1TCg0b6jJv614=
X-Received: by 2002:a17:90b:134e:b0:3b0:a7e7:68f5 with SMTP id 98e67ed59e1d1-3b41c7b638bmr13032229a91.7.1795582276887;
        Tue, 24 Nov 2026 20:51:16 -0800 (PST)
Received: from localhost ([153.61.198.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm30569330a91.8.2026.11.24.20.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 20:51:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 04:51:16 +0000
Message-Id: <DN40SM25BZ6Z.34Q3QLH6PYUXL@gmail.com>
Subject: Re: [PATCH v1] arm64: Mitigate Spectre v1 in the BPF interpreter
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ryan Roberts" <ryan.roberts@arm.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>
Cc: "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "John Fastabend"
 <john.fastabend@gmail.com>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <stable@vger.kernel.org>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261117172341.3152407-1-ryan.roberts@arm.com>
 <DMYSI3BOQWOC.2P2FZB0H872DR@gmail.com> <awAay4FFj1_wQtaL@arm.com>
 <DN07ZMOAD4GP.37PG3XUPBG4CM@gmail.com>
 <a6cda8a2-992f-41f9-a814-ee78363c3a69@arm.com>
 <DN2ALO12MI1Z.3HI553HDMO2FL@gmail.com>
 <85385aae-af06-4742-a39b-5a95e3e73a7e@arm.com> <awRd1mHcQDVNi9U9@arm.com>
 <0fad3d48-54cc-4919-bff9-254347c933c4@arm.com>
In-Reply-To: <0fad3d48-54cc-4919-bff9-254347c933c4@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_205118_280980_7B78E427 
X-CRM114-Status: UNSURE (   7.55  )
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

On Mon Nov 23, 2026 at 4:48 PM UTC, Ryan Roberts wrote:
>>=20
>> If Alexei makes the Kconfig change to force JIT always on, I'd be
>> inclined to drop this patch.
>
> Works for me.

kconfig change was applied to bpf-next.


