Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF8E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sc903Ti/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=frrFfKQD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oZFbZu0+kSU0ykNmAfKFLTt1Nnu3oYAy3AIE96bAt98=; b=sc903Ti/nujpEIK9Ad9yPGC5sS
	juVrwDILOMEdGRV2SUdw3B4IlqCkWbErgovb9uvfK8kBIvTKdDs60L6TGZGXEbwIgeKm4HLWpei6K
	VXv/wdmTrDJFY3gr5HKF23vEtb4FygJ0Hv5qQPzyebs1vQqzdCLX7EJa0ko5ZTBJgNdkdZj7wVAiK
	FlFtvqw3hofMqgBGxiuZpPpIXG6Jy/L2iSQmJ4dhxumH4Hd2XwlXk3N+mRKzp7+OcpEufu/pM4/pU
	Zp11kbuNsqe3F+F/8FYUPjhN+QTne5K+Q5XWFNyXIFvTkgp7TwmvEpNojD5m+xxMQ0FRCjSxSvnG8
	i+AcLBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNvx-0000000Bkoy-3Ilf;
	Thu, 26 Nov 2026 01:05:57 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNvZ-0000000BkjV-3xzD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 01:05:35 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-71ab5e64742so3932539eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 17:05:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795655132; cv=none;
        d=google.com; s=arc-20260327;
        b=kVa9kJecXk6B4XFZrhP7UzklHMPd+8Oq9obcnAN7aXHX8f0Mz9OIhB/WgmqOth8tA6
         gy11fAuqPSDb9amlNWwc8gTy0uNrrUGSOpMkg5B9Zi6pzLAFTJJ8La7yhZ1vmD5NTOf0
         ZYTTsv2YOZRMXYG8sxL8Rpf74FRlmuUM/P3N4i1mTHs+XBb1ns9iYGj69sDJUuFi6O+x
         uP7Lg5m0QKtWJmowfGrk8qQ67zLOngAkLOjWw0APX4WJkBEfUkZaKKQpO4W9P2mABz10
         vaIJTrG56m+d3P4OQgSJIXvFmY55ImgJ0G3gbBdTn28aJ3uiPnAVylPW1VIsxirkY/tf
         mSwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oZFbZu0+kSU0ykNmAfKFLTt1Nnu3oYAy3AIE96bAt98=;
        fh=aA84giAYfPgxZO4+w68I+liEhUpmu3vWB+MAl4upR4s=;
        b=lhf3D3IS7a9t0Xf/XNn7D2wJZHT9Q3H2uIZhMC1WqFNq/dkmygsuLY2CJ7u1cEmdRM
         CrclpCmzskXCmMO/kKhQmsJ7ZkBjZIsDh63FnGJwi9uataM6EogNp9qqwxC8VZ7HxXgW
         71/r49HHC7MbIdBipOqOQNnyNXv4qtmVcr891fP6SLV4ZmV8syX1qWcx7Wc7l2BTYRUj
         TK70U+GqIdRo8RtW8nF6a5e8DZv5+H7dvFOEgtsQyqdhwYyZrlfMzvPYK8Ylfmt6vdAm
         6K3rNPLJvJhPssWLLWNHpNtfLMHzAarZZCKl2YIbWyAzeZkGynSxoMG9aEI5Ce/ulxVv
         t7Lg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655132; x=1796259932; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZFbZu0+kSU0ykNmAfKFLTt1Nnu3oYAy3AIE96bAt98=;
        b=frrFfKQDyTihzx3DVgqDXuClkUvX1IMFLp/zS4ozMADD4zxTQH1njRRha4j9RsoBbg
         PMdXYM0kiwO2DRVXMkbiE6RvStqwKlE5kp/+zo4o8HCCp7vrd+Tw8zWAcpp0cW9t/dmP
         p4WuTjdYVo3TUmO9sntH517RzBaPo1PfBSfBUCFKD2V96sC04LAp7Lr7NdVPc7ae9DU5
         NPxXzaf4pHKW9NbdSt7qXSUwRLUauTQRxKSgwF9kNEFaLpgfbajns2Zgsuvsa1G+iiu7
         ixKSMe0240oIBbyh+keFfVTR9EOu/7DRzXSkKq0nHym8S39D6UILoZF62c1CY57jNktJ
         pW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655132; x=1796259932;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oZFbZu0+kSU0ykNmAfKFLTt1Nnu3oYAy3AIE96bAt98=;
        b=L2w5EbBHSnNJkmXY+gWtNwgenYSTAVIKsN2iyz1wxs6jxEK0o987SVsSZHR76HUorW
         qDNHij8JDtX7cFCCv6g4koqqlYkFJJHiy+SGZ7XsetkCcAWW/piE2babz/a9OPhBuedl
         J6raa7sRbAJSCCKHZoW02TstQ4eVYO29kn/i9Qn9abjV6uFguZ8F7OqIZZuC46yktX48
         tAytMbmIULnNY7VjqpB8nK5w4jLSa6sV2jbwYktlaJD7/vTYGcB05VoknaJxB0isi+Ut
         VnNGJnxfKMfDK/BGs30RqOp2W6iif0Dxv3Hgr6loUtNC5PCVRwggvT2pVxmR1Rrd3r1s
         +Z7w==
X-Forwarded-Encrypted: i=1; AL+hErH86wAxwgzfVxJAf1qNpMRfUMm8q3Mow8rfGSRU+6EBu/Mm9IeUqfEAm2iDTnqkrFVi+ExFK0qfPMbb31ZDqxKa@lists.infradead.org
X-Gm-Message-State: APuU4Z/dHowIoMz+/j97mt+TowiUq5OCPmO8S+ebP+lrNm1lX1kcR5Lo
	P+EOpcpmrYHSCoVSOFDLhRV/L6YKmEyibS57z7V55K5rPzyfvS0BWh42/OGLsv5KiBYLdl1sxWx
	ztZkB2tX+vEB3oAhYpoLNVSInTmIXztU=
X-Gm-Gg: AZFdTZfdvj5A6nqZKL+vPu3JgDkLXnAL/wdJDiVSBiMheYwUhfHMUzeNghz4Tc/vTOJ
	/G3D5NGPvhFa7Y3U96W6nDTVwDrvzX+v3OKvPEmXQJAJ2l5vDnrXfZddyjX/zE/JWDIFf0iOKYz
	NXoyGFy9ZQ7LbqAxHg+krXzXO5adAif0OJoKbM06vo94T5QAU6c7AIPzvpijY2Mb6k7INpy4q/b
	ZMwIsuIFfGcdQRzGsEYINP+xIEndIayAU9I2+/KR5Wn9lgu1Y6h7sPe5Z/cwsR4v401QY0+ikU3
	vUpDFrE8bp1LVvkHTGYpIV1686eo/qta9gOPDlIU3XhOz7/oRAmXMeXMsLIJNvFG3QKMtZFfkoo
	nfxc/Cy8er4GqpsESpiwf3DkyGf1X50K2hDgOFgF7YlyPKRDXfmdHTmvBuCRZE/dd5daP07JDJ8
	auLp4qDd+U5mG+cA==
X-Received: by 2002:a05:6820:c5cf:10b0:71b:82fc:ad8c with SMTP id
 006d021491bc7-71b82fcb56fmr1443500eaf.44.1795655131818; Wed, 25 Nov 2026
 17:05:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121-sp11-noturbo-v1-1-37e1083cec5b@gmail.com> <20261123-eccentric-ludicrous-roadrunner-0a7efe@sudeepholla>
In-Reply-To: <20261123-eccentric-ludicrous-roadrunner-0a7efe@sudeepholla>
From: Dale Whinham <daleyo@gmail.com>
Date: Thu, 26 Nov 2026 01:04:55 +0000
X-Gm-Features: Aa3M54oTuIZ-TKok2yilEFNywBJAakQOAVzcdKFaeMZPoEEMc6Y-VCIDW_86pZY
Message-ID: <CAFcmK8g+Udyp9h24WSEx2RepBA=rZpEQs==1hTi83A+_zF-GOw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Don't mark OPPs as turbo without a
 sustained frequency
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Dhruva Gole <d-gole@ti.com>, 
	Haipeng Lin <jimmie.lin@gmail.com>, Charlie Garner <charlie@akao.au>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_170533_986807_701A0B85 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon, 23 Nov 2026 at 10:26, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> Charlie had posted a fix for this a while ago but never got back to my
> comments.[1]

Apologies, I hadn't seen that patch, but I'm glad you are familiar
with the issue.

> I worked out something very similar as a solution. Anyways does it work
> if we also add the check for non-zero dom->sustained_perf_level ?

Haipeng Lin has an X1P machine so hopefully he will be able to confirm
soon if adding a check for non-zero sustained_perf_level into the
chain still works.

> No need to repost if you agree, I will fix it up while applying ?

Absolutely fine with me, thank you.

Best regards,
Dale

