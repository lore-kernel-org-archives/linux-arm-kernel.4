Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED579606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xiGycJcB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UvdnVImc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4wr+TVHDubo7QkZWmXYb7l0IP18SbqIz/pFvG9rCN0M=; b=xiGycJcB8VDMlM
	Ld97u++3Uc916GdDX8rphn79iSuZgfR5G8v8TsypLEHLLapVoEzAKMKBVHpBZasqLOIhqfYmcGfTp
	8cg+tVIUNBnMMz2V14ymgVwoaLZS7siZo46MrwNJhxZISCQu43CZ++Y6Jb7Zi04nYzBAmhYM//Srg
	nYN5VBr0lZLXqL6L/h8U+5wb05e2hJyBGrTvCXaE5GwKZ5Kd/s4RQrNC3e+u7vPGag6DM6tVgXm+k
	zX+e3EPBPtbG9qnTuYVCdR7f8kseGP8/BjpahaDa/Zu4jBunwtruByxYvHL7S53LtRD+M5SDQ0v//
	RmZo20qtLL4jRWFXG2YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8UY-00000006pYM-3U5Y;
	Wed, 11 Nov 2026 13:35:58 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8UU-00000006pXj-3261
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:35:57 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-36f8cdd30beso5514382eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 05:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404154; x=1795008954; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4wr+TVHDubo7QkZWmXYb7l0IP18SbqIz/pFvG9rCN0M=;
        b=UvdnVImcFY807q8npIAX4fPK2QKOWqMnRhsyT1x1srV0Cf6UuHQ9sz2CxAxkYywK1P
         qzu0EVjw9TSswOxj85t0KMnr4n57OOUDXX+nGf16iJQ20VgmIjN/38jFuQsx1xkzxx/V
         aVT/Egloo28qQJO3hvnXH52UQ0MAByc6ppEacsYQ2cvpUBPvq0pUQ2YgZP2Mjp/qokDu
         zQQGe7S0mWct4KWG7G5vMxBUKiCJB4wcOpCQoq7rS26os1kkbk8t0rZ/CNK5Zc9MghZh
         OkgkyLtT3xZ/pB+VkZK5b+pzwy0Eq3ld/TUibNXG/HUTdazW6ZU5kBTeaShZG5nLvXcb
         dn/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404154; x=1795008954;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4wr+TVHDubo7QkZWmXYb7l0IP18SbqIz/pFvG9rCN0M=;
        b=ZqE8CQgIjjnjCOg6Pn2lAkDF8j+4Xovd5NLs1r9/PW2U797Kk3y2h9kklrDP/+lw4v
         0GUtUmZOGxnU/m4O3fmROFZL8unang4w2aRAKS6nn6BWmwP/vS3Y1VjpBdYiXf5ylqP9
         Lkbya1005BzvDh/rimXFTAMB6QVszBoFp36PSemdoorZxjok77CHtxMP5LKXpm9X/nHA
         t+PyweWCxa3tCpyqYPYD02k6baamlRbLcgpYGYO5Dy+EoZibDSqhZ2dQ7o1JzQ/jMA9G
         OqeWHJY30rEK5rCQoIFdgF7yvC8MNOski97b6jgsVHDw/WMz0gXErzm+S4n8tF0/Dj1L
         x1Cw==
X-Forwarded-Encrypted: i=1; AL+hErG/4WzURwAOTvKBCa8gxKqqs4CxdbcNFdalr5+Wz3K2wsHjssV/DH3QKJwVtDIMRcMsoeipk+ikpOV0VKTEaiGE@lists.infradead.org
X-Gm-Message-State: APuU4Z+ieq1Nwuleokp5q3SPRgxL4gaf9bogKXIqKrVq2AyVIbFIGfKT
	mlbnaj7UAylScNvqu4rUVW61yaVEHPeYjmElerWmWjP3DeaEN5iRghmf
X-Gm-Gg: AYBFou3vdaiEEeyf+5yr42kcX4gNSQqASl+vpxKAyAYMzjIVspCh/elu/zqlyTVhb41
	6A2EelgEC/LNYaVegdHotO69IjtTNVonveSuOKihE3+KoJfWzmJUAjWxKyuoL7wEzRPkmYqPu5N
	Tb2VKfh+YcFLjoKSBHiS+52dmEDDX9Px/DCS7rLNgYlQGFF3vzHHiTQZZoQNN0SFq7ZTEf3kWJk
	vxX5Zoyhz/o3l+ex5CwdIu1i4WAp5yd0B6VUEMuqdPZ6VQquxtF0hXlENg8WFv6/o1OvhLdPHtu
	u00vgx8f7LD/PLdWckD9qumJRLKXgQy8UOJ5yBmx1wEavMMN4InQY5QnVrtnK9tb1uGv9I29+NB
	E+H5Q3NrPNMs13OSQQGrHJpUZ6pNe1o1pUDlCZsqyRn/yHp2UVpkl+PG6dLGiM/wYPh+FEj7Nx6
	JT9NDG7NYV8Dxjl7Zu3QL9j/S0BtszD6I+FwIW90FE+AubgdGS0toqwFOK6z/GP7ArzSZO4B/M+
	EYBbK5DVvOo47n2EDRm7l3UDlH8WZmhxHfh4rg12hbxLst/L8Ue+58STIpwzVOgjM9WOEj7okOz
	2R+Akc2QweC8lckMX9Ek2SQi81M=
X-Received: by 2002:a05:7301:db15:b0:375:b560:a323 with SMTP id 5a478bee46e88-3768366a43cmr3063455eec.1.1794404153449;
        Wed, 11 Nov 2026 05:35:53 -0800 (PST)
Received: from [127.0.1.1] ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9d78sm17768172eec.25.2026.11.11.05.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:35:51 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, John Garry <john.garry@linux.dev>, Ilkka Koskinen <ilkka@os.amperecomputing.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix misspelled PublicDescription keys
Date: Wed, 11 Nov 2026 13:35:48 +0000
Message-ID: <179440414898.2353714.11591904089911934138@gmail.com>
In-Reply-To: <39ac224f-2903-496e-9a08-b4c5a33dc87f@linaro.org>
References: <20261108183846.3804875-1-takano32@gmail.com> <bf6925f6-613f-4e20-8491-2a99183f34fb@linaro.org> <39ac224f-2903-496e-9a08-b4c5a33dc87f@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: kpatch-send.py
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_053554_761876_942778BB 
X-CRM114-Status: GOOD (  15.38  )
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

On 2026-11-11 10:16, James Clark wrote:

> IMO I would rather have something that's incredibly strict and simple,
> or nothing at all. Having to work around edge cases and report near
> misses doesn't sound great.

Agreed, and the near-miss report is gone.  The series is posted again:

https://lore.kernel.org/linux-perf-users/20261111132622.2349165-1-takano32@gmail.com/

The check is now a fixed list of the 51 keys a json object under arch/ may
carry: 47 of them jevents.py reads, one more metric.py reads, and three are
read by nothing although the tables hold them (Counter, CountersNumFixed,
CountersNumGeneric).  A key outside that list is reported with the object
that carries it.  There is no cut-off, no similarity and nothing that
depends on what a run of the generator happened to read, so there is no
edge case left to work around.

It still runs as "make check-jevents" and as a perf test rather than as part
of the build, and on the tree today it reports exactly the two misspellings
we have, the 16 in this file and 3 in the AMD tables, so it wants those
fixes in front of it or together with it.

The one thing I did not do is put the list in a json schema file, because
perf's build would then require jsonschema, which it does not use today and
which is not in every builder's python.  The list holds the same names that
a schema with "additionalProperties": false would say.  If you would rather
have the schema file and take the dependency, it is a small change from
here.


