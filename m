Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2A8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 06:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0TQ/kkIo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tpGMuTKw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t6Jg07tsLCsIeZZ/dxjj77HUXiYcwZwtBpyyogJ2quQ=; b=0TQ/kkIoFl/eUW
	dHtMh1WhoMv6D/XcpTfeVk11T+VwzzGzqLbqnTa0nAFcn/U+L/bNbymGLnDL5maD41YByoyX4EfEP
	r7wE+B06X5qvKqkQ8jiN9o2EZcoWBgIKyLUtaiMgzRrxfp5DsYfgQ10EXeC7veGpFPjumsU++5lTy
	scE7ijAqJUapyriJHG/S+8T9obt4SE1oRoLVVmSNk7yoZHNlrq7yCJklLmcZbkEo47x3tWkftM2mB
	oh2wIIK/phOmjgl07sAjTWM0rMsyEDnOfns9VH8qYhIwH0hnSUGFGE5sHtJ0I+djr45KsW2HdY2Os
	wnpUWcHZPNNGYn+x2Xdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkxf-0000000BnTp-0yke;
	Fri, 13 Nov 2026 06:40:35 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkxc-0000000BnTQ-0z4P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 06:40:34 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-170135e43c7so1786925c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 22:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794552031; x=1795156831; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t6Jg07tsLCsIeZZ/dxjj77HUXiYcwZwtBpyyogJ2quQ=;
        b=tpGMuTKwI/iXTPtGErRr2KmTXYQXL1CG2rIbhMdvOPZnxA38h3IKuVWnQsmEVY3ZYw
         0TtJ2KeGoC6D0xmF+nab9b81IHgNjFi2e6Pq1N/bkN1fKfp8xo3Y4pn1PPkeQ7A7XLSX
         S/imzUYiIzQnYjtJF3Nse4QKYcYCYrL4INhb8LrW2UBTcVCJrgWQ0Ou0BXJvDOH0Tll3
         0cYMMaOeOh3eX70MRPSd4h0BoDiDAoajUxU400StioCKa0GHH1WmIR2hTwMiZjgMd6Bv
         jPSbb4AKrGzUC7Q7tkZDesq//tAN6+NG3+F0oAqZZ62xaR37VWDfVt+Uk9QiZwX4/hpZ
         zpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794552031; x=1795156831;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6Jg07tsLCsIeZZ/dxjj77HUXiYcwZwtBpyyogJ2quQ=;
        b=JrvYXP+PI2/pR5aFkoQ0dd4aB6eK1Ydn+DjanIIEqFN2qtj8gjKssaJnLOd/dyJl9y
         FEURH2UpgAX6Y1v+Up9Q36mmq0Zzx+5xv76hhJEruiTLkbAYZ+gXENR1caBRQTT/EtiU
         cnusg8SXjfqb1qGkZdy+9sH6wQ7n6R9OjNLkN+vU0ZO8pyERWV1BidUmRshyc5ZwxYmJ
         AFqE/lAuQeYE9IGdNSijSVogz/DPa68dIKm6+JlMBG4SJiqo4NRkMxmwyKSLuRBYJylG
         GL3ltWRjqUX8UTpzX5G2WoaqCH+T0B8m5WYWvLH0Uubs3Tu38jBYWBUX4Z1sGzgEWV9T
         +nOA==
X-Forwarded-Encrypted: i=1; AL+hErHhJiCYo71mb9jw4+qwc35HR1w+/Qg8gfWGkx4aMIfxV9hUJMFgHYuY4w7kbeCD2q5OMCmSuD9RAzwevMN4i33+@lists.infradead.org
X-Gm-Message-State: APuU4Z88TKQTUh2q8l+h/8BHfj7V7KezGp3kG4v9AK9/ChWEm4MgM9LY
	399AD5Sg1wFI2f09+ywMN0+uNfHibBGRTG6/Z22VbipsUfv9IS6q1GXOLZGV6A==
X-Gm-Gg: AYBFou2P/1qtEzPctLd0dGh9+kzpf2PbBhum3aT4Q6jSF87FKEF2LLB8ANhHC3JQ7f6
	DMkMN2zndVOzM25iGwr7dc5Iat1mrfG9fw0hbutp1A1ciXjzYy4pQ6lo6zBZKlHcmBG3U0EmdKO
	xB+V4KjV3x/dbAnS8kSvNol9f3GW2+PAafDz+SZ+RTesmSfF41nGIcbVsyP/cSOMtW0j8HnNt1F
	w2UHVa6h/XCbuUAiHEB0js9YZL1oVPmJyR5d1i9KXMlha6Yh3RqTNLpDBL3/kpDIF7fxM+IwoAH
	//yq0VSZp61ku3qODuECZoQ4VC3leKBpXebHpeNkw36gPzsdi+rDSj+N6lGdzSL2xqmHuf7HL/I
	d9ln/kqwmhXkuM+6zqvlQn4lUG4SN2Af6gtHmZghv0sNqGaWxgaCYVrAgxtTeH1pFUSLH2Xgt5C
	LNDiGBKTZSAJe5c3pseoqoyHXUFpDyTaPDPRL9AIJT7bMQCT6qKH1tzPI8eQaaPx9komWEeQtBs
	aRPgYq4O4oaa8q7ETydZRG9WeeWIn0jI+STHGK/YCF5KJNqwSfAtDpDhMMtz5b8ptidwAVz1yqu
	kb8VyWFSWHJBVWzCSY/W/JFUsQYPDweWOutbF1sG39dDJGg=
X-Received: by 2002:a05:701b:4248:10b0:1b3:b455:93db with SMTP id a92af1059eb24-1b503131b06mr1869718c88.24.1794552030463;
        Thu, 12 Nov 2026 22:40:30 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm6321205c88.9.2026.11.12.22.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:40:29 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, John Garry <john.garry@linux.dev>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix misspelled PublicDescription keys
Date: Fri, 13 Nov 2026 06:40:27 +0000
Message-ID: <179455202729.738309.5850348519213838978@gmail.com>
In-Reply-To: <1e5907fc-40c6-4025-8d27-a92b3cb2845a@linaro.org>
References: <20261108183846.3804875-1-takano32@gmail.com> <bf6925f6-613f-4e20-8491-2a99183f34fb@linaro.org> <1e5907fc-40c6-4025-8d27-a92b3cb2845a@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_224032_427667_C4211BFD 
X-CRM114-Status: GOOD (  17.67  )
X-Spam-Score: -1.9 (-)
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

On 2026-11-11 14:03, James Clark wrote:

> The linked patches seem like a bigger change than what I'd expect. I'm
> not sure that's necessary for something conceptually as simple as
> "validate the json files".

Agreed, and that version is gone.  What is posted now is one patch: the
list of keys a table may carry, and a walk that reports the ones it does
not.  No schema, no similarity, no metric-name check, nothing wired into
the build.

https://lore.kernel.org/linux-perf-users/20261113032927.634183-1-takano32@gmail.com/

> I'm also a bit lost about the relationship between "[PATCH 0/3] perf
> jevents: Report the JSON keys that jevents.py never reads" and "[PATCH]
> perf jevents: Check the JSON keys that jevents.py never reads".

The 0/3 was the first posting, and it had collected two unrelated changes
on the way - a report for a metric expression with no event behind it, and
making the arch argument optional.  Both are dropped.  Since v7 it is a
single patch, and the only thing it does is the key check.

> Even without jsonschema I can't see why a validator can't be written in
> less than 10 lines.

It can, and that is what v10 is.  The check itself is

  for path in sorted(Path(root).rglob('*.json')):
    if path.name.endswith('metricgroups.json'):
      continue
    for obj in json.loads(path.read_text(encoding='utf-8')):
      if extra := set(obj) - _TABLE_KEYS:
        print(f'{path}: {sorted(extra)}')
        bad += 1

plus a directory check, the 51-word list, and a shell test that feeds it a
known key and a bad one.  On today's tree it reports 19 keys in four
tables.

My earlier answer to this went into the other thread by mistake (wrong
In-Reply-To), which is why this one looked unanswered.

This thread is the data half: the 16 keys in ampereonex/mmu.json and the 3
in the AMD tables are still in the tree, so the check reports them today.
I can post the corrected table as a v2 whenever you want it - the check is
not a prerequisite for it.

Written with Hermes Agent, an LLM assistant; the author reviewed it and ran
the checks it describes.


