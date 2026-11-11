Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DABC606A324
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 12:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XU3P3Lh+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AfghdrTP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LZaPAQBVelDTdaBdHa18VdLK1p5kWkR6/VtxrrA9a1Y=; b=XU3P3Lh+avkRvz
	O/6iZORQ63u9TG/WE04E5fTPtI5v73gHiHOF1/WXw23q9cYszy88zGKWy2vGZmRVAcsO0cwjlqgki
	BwDAmZa66T9UaIiVXQA3po7B6SqYGurDtE4BIfEdesYtnoZAvyPPwJlCI1WecU+TyW7cMxRm2Pr9F
	HT03sXBJYJaf3Cl+1jKfN1yQlCf0JKZnKTxT+jv53tjOq2YW9Q/OIKpqqY7quP8h/KzALaj9cEuQv
	LicqyX3J2JJEbt4HYOtuJR+uTzBZ0T1ltdJ4qz4RPjN8EONBe/mKL236jUjqNYoVUClBQN1inY2kd
	9rM9dlzRzoiCOyTpewCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7sE-00000006jen-0S8Z;
	Wed, 11 Nov 2026 12:56:22 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7s8-00000006jdX-2RsH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 12:56:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso1364065b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 04:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794401776; x=1795006576; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZaPAQBVelDTdaBdHa18VdLK1p5kWkR6/VtxrrA9a1Y=;
        b=AfghdrTPMbXUIlFl3Qd/wi6l3AeUfFrunNbCjLJNKG/wobRuSAbiffS3vscKklTAKY
         M0zdZOyZy2hl6GzB+3g9tNNKubpaH5RILMOHdBnNR1Ye07sgqBxdjjOltn47MRAqyRnU
         /dTN9X2kpYS1940AfGvyw2U0YE6ZnNTaIJXAArAt7aiTcgfqPZyE7ApeWjvdHp8B6ALn
         bLOo05QLLfyaLw6BMQu2/Ebe5xJLWOaEPyyGBcS8PXjTDZLXPDm1t1Qv7U1dFWx6TvgU
         M6ZfhxP4eTAQ2ItYv6tRdQQ7Sso62hd9XBmdwl5ZfvfjKEMaVjc6fM5nIyu5LVUEIiBq
         v4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401776; x=1795006576;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZaPAQBVelDTdaBdHa18VdLK1p5kWkR6/VtxrrA9a1Y=;
        b=UJuGb4EwI7MZNLLF/PowertC+KE2rseVNnCLjf8xOFbwNbhdWrxiByO90WhufMDYtc
         srgRp3hcPJl1FBQFpulbWoBd/HPorh9p+ScIzVItsxh3UIso2h34M4sqpZ485fTeifoD
         WhXqJRXHFq6wWl0p5tFBThD4sPzSM0mPTtup8H6I3h5bqf2yCxWM7fNuyREIjy67OvOv
         bVZB1mHLZbYZcOLqk+eL2YnafdWXSo2ZEEbDbpDw888lP3pgBsj/5yOPJIZaPIdeklML
         cfBMxgifVWuHPDYoCBGFpduiutE8LOf3vQoozAfL7rV1jZclcjxS6sHLoYwXPurmlvpE
         rVPQ==
X-Forwarded-Encrypted: i=1; AL+hErHwIxbswYEMe2KdBwhIjiByc1tpbhLEis+sAhTH+ziDhvnLiYk+F2tpdQvbgiKoupOE+BPSTlDgWEbE5ABwrcSg@lists.infradead.org
X-Gm-Message-State: APuU4Z+eY6NgmSm6ZzSj2uzpVusU1qu9YRFQM498GBRJ5sKh863lOzg9
	L0BXNdOlFFFrtXJRgH7dESRq1tEaJ9s1CdeMiNo3EHreiijfpaQV8Gkj
X-Gm-Gg: AYBFou1TO5oV4twBLJG1rIylWo5EqsiiYTZClf+BOw54YriBjkwynAcKGtg0KFed8m6
	wCyzKReKHEIlKpV2oCHAjOJvn6OZmgEvP/WqgZCUT9OREixg8NY3TH8+3MT2bWsSJZCVCWTk3+6
	s+F30bxbBtsXCcT0nqe8fhkcanLIF64hTgA+A1jVgbwfuF0CnjrEAfLLo6XzsewigiIrb8QeIvR
	Pj9mMrMje1VNzn0zCLtzubZ9nsMnltifQJgtMN3sBRlhdMUWuNxZOSRNuhw3l9s9IytFoYIxn+8
	HLLcjty6q2fWNxg3Q9eth+hDkdaOOi+Q6abFgRyFQP1rSErSxX8PTdt1Ta+Uc+6SkDFev7G+lij
	xjPJ6Nf0wa7GYufu0ZJrQM1w8Ch7Jzs+hoT2R/xke07mF3qugi2Vd7CtDfM/fjwf/VzcOGVUKwo
	7VjvJ/s60gWbJxmyqGftU3NmZVZJygb80Zvm8fJLJfKpwjUrszl3Gfw3UPHzl4JoEnnhucVQxp7
	yNYXZkAjNz+Lbc4eGCaSCSOL08I+o9oYr5jnRw6YVtV6UPtO45tTb4+ozFRmq16wdxITwpOfwEP
	1h2RCjwSh7eb7JvtqY6aDXTnVb45nOElng==
X-Received: by 2002:a05:6a00:1382:b0:87c:e44e:5694 with SMTP id d2e1a72fcca58-8bc1cb715f1mr2475584b3a.21.1794401775648;
        Wed, 11 Nov 2026 04:56:15 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa2a6d79sm2130859b3a.10.2026.11.11.04.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:56:14 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: leeonion.muyu@gmail.com,
	ben.horgan@arm.com,
	james.morse@arm.com
Cc: reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm_mpam: Account for a MBWU overflow before reading the counter value
Date: Wed, 11 Nov 2026 20:56:01 +0800
Message-Id: <20261111125601.4120592-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d45dd5d2-15d2-41fc-adef-b8e9af9eb1a9@arm.com>
References: <d45dd5d2-15d2-41fc-adef-b8e9af9eb1a9@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_045616_627163_0CDDE40A 
X-CRM114-Status: GOOD (  15.68  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: leeonion.muyu@gmail.com

Hi Ben,

Thanks for taking a look.

> Is the a theoretical fix or has this been observed in practice?

Not observed in practice. My hardware team was reviewing the software
overflow and NRDY checking logic with me, and we found this while
walking through the code together.

> Based on this, for MBWU you should only see NRDY set in the
> MAX_NRDY_USEC after a change of monitor settings. At such a reset
> the VALUE is reset to 0. Are you seeing or potentially seeing an
> overflow in this window of time?

I agree. Our starting assumption was IHI0099B.d 6.2.1 RGKWNB - that on
a settings update the monitor VALUE field keeps counting using the new
criteria without automatically resetting to 0. But as you point out,
looking at the reconfiguration path in write_msmon_ctl_flt_vals(),
the driver deliberately writes VALUE to 0 as part of the IDGYLF
sequence, so the accumulated count is discarded there and even a
31-bit monitor cannot overflow within the NRDY window after a
reconfiguration. The overflow and NRDY cannot collide.

My apologies - there was a second trigger in my original analysis
that the commit message failed to mention: any error reading the
counter value after the status bit has been cleared loses the
accounting the same way, and mpam_msmon_read() does not retry
non-EBUSY errors. For a MPAM_F capable MSC, mpam_msc_read_mbwu_l()
and mpam_read_monsel_reg() go through the PCC mailbox and can return
-ETIMEDOUT or -EIO on transport errors. So I believe the patch still
provides protection against this failure path - it moves the
accounting to the point where the status bit has been read but not
yet cleared, and it is a no-op in the normal path.

Thanks,
Ping

