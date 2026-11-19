Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAE6606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xKKpDNA+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hv48jMV4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=msdP55vXlTy09UO8puWvvjC8jVxycl34xfHbtsiaeYU=; b=xKKpDNA+NjdbVq
	dFAgWvcPBJoLwcZ4KOlcfZuaymI64YVLFMntDd+cvAQEgsniOYWkRWqwU1Y0VAOBz2FDXrHgOh6p5
	PotxVcSnKoyPiqsEtaIBenllFU8UaXPePS8X7GegPoY/Qg6NInVeSZ1f4HMJAIE7ZcGzAIXV1JU7d
	MGaxhoPCEMPbPmyWrmGCsl7DQZ+6ODVSkSZG93JbLH3vylw9AhdW0hpdR+8vlFhkI+HrfgGLBpDiE
	3Qe+We7Hwh2EA3Yw0UsKISzX9hFGeMU64p4/tjY1rcCFK3B+PdoPB+GK15xapKIogbULZTaMeUHYJ
	Llu+r0r38W0i+ASgK0hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU32p-0000000CDGV-08ly;
	Thu, 19 Nov 2026 14:23:23 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU32m-0000000CDFU-228u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:23:21 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1b3acec6677so3303501c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 06:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795098198; x=1795702998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msdP55vXlTy09UO8puWvvjC8jVxycl34xfHbtsiaeYU=;
        b=Hv48jMV40t1uhHw4cjWiEStzH5fSPajH/9dia2kBcfZpicCwT/Y2I2qkY5EHYqqdXX
         sBiwlV/23hSQS6wCyjNVC+/xIAyMRzOUmjgVb0by1DtVNMlhTyssxUkiliaP81y0In02
         xv1LxRK2tdbRCwY6g6XDvmunGgfI+aRv3GGVi2/2EUbWaGMgo1n4nH8Y4PTsCA38tSa+
         3Ja8QClrW8K2px4FDu8zTlzdeosNgOYWd7sA7WO3XVlw1PSFquuaz3dFXVnYi+PAJvkl
         +Qt/PC4bMpRdD1pul1V1VMXS2kBrFQYUAYlGIJXHUykE6e9tY8un5o7d6/5Nb5qWxt8O
         M3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098198; x=1795702998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=msdP55vXlTy09UO8puWvvjC8jVxycl34xfHbtsiaeYU=;
        b=P4XB2OxwrMPQ0K0RMyFk+2bUl+naAyzyyIUwnwdj2LaFIqSk6eyb2ysqkoiEeavb8f
         tpn5rvAG+0B0iE2cizWPTAj467ypHWf8EVjIFfz5zoC7KoFR1AL3YllZ8pEu60f9YaXL
         SJTeGOlfnAUYEPXGGGa8Tj9JBVLKpmMM/hERsh9MS6aVWYyKLbk6PzyzPKzsgjqyDhLr
         Of/enIY3UOnTi0L5rjtt2Y1ODrkhxLniycHEu3fyNirO1kZeg22Mq4hZVW1LbYASttjv
         HMBEwFyTwgS/6vv0w1BxYd3nAbxvVIUoabuZVBmfmqS9FHIlcJsR7VqwAA4pI1vFTF9z
         xq6Q==
X-Forwarded-Encrypted: i=1; AL+hErFPayokwn7JnVprZ4lluyql8XnBgAGnsmTlCPsbynXxWbZXf81gy9BM+Na3t+At07sMBUoCC0BUGGBJupgh/MPf@lists.infradead.org
X-Gm-Message-State: APuU4Z/aS4HAWPmRATYTl88ptnsFXJd/8o7xKJkLHT/OhE8cggKq6Way
	wT59BOUGPTwsCyjVrOPgpEMQguHyXVU+dRd1xjraDi4GaFALTdpBxIBn
X-Gm-Gg: AYBFou13In5AhKrv0C08iwAHw9rfXLZfORTsWJAudWHn9pKI8wEtHbbOT9UoFJhGhyR
	cGcaKMAYFeiIVoccUKi9U6GoiOhwmh5SF9Xp0cppoXZPypHyvegHYRdu/FjqYSw1s1Bjv+aj9Sm
	tbpfzDcFd0he4cSPUqtUeUF8qwpBOT19f15mashT2SeHs4szUdo/drIsPooBqn9HvOhK+a+2F49
	GNZ6q5qRQfYdo3eE0Rsv6XDetZKAcBrpmBOJkSDErTF9yeaJ1pM6Kp7XiPLhvxgNA3Le5m54oVu
	wsBFs8Px/KNzpkcyckOwaQKIfMwjdtCqb47qDvaKw4uTDnQJVYqu2+PaSF5WYWU29jra6m/CS8L
	HUs2mm2IV3Cf95lsJqKpGNJDzMVAlJBuB8QjLjoOf/5akGuki28awuz9fCHFs8txYHQPc1vwBgn
	UUjwgB1L/IiSYTFv99Q8OWrqupX59z1lLU/gZkHLjykKvcSfgmDNY2VzQCg4uJ8mI2JTV+2yLDg
	ynaZVBH8sZ5E82TxQ+Id1MD96rilr7uS+P8V7kzGMYaNZbKag3ZAqlb/U67N3TQ8v92QGEs5XEv
	WvZ5MvBMOCRGZajD0h8255tg9XzUtxR+2bdG9uG3jpSnCr5XO1B4
X-Received: by 2002:a05:701a:c961:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b543d09a83mr5609963c88.10.1795098197560;
        Thu, 19 Nov 2026 06:23:17 -0800 (PST)
Received: from localhost.localdomain ([103.149.158.188])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b549e398e4sm10306022c88.15.2026.11.19.06.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:23:17 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: krzk@kernel.org
Cc: alim.akhtar@samsung.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	peter.griffin@linaro.org,
	robh@kernel.org,
	sreekuttan2156239@gmail.com
Subject: Re: [PATCH v8] PCI: exynos: Handle PCIe PHY initialization errors 
Date: Thu, 19 Nov 2026 14:22:51 +0000
Message-ID: <20261119142251.2665-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <0a3b7886-3800-42ee-8e22-80944114dfcf@kernel.org>
References: <0a3b7886-3800-42ee-8e22-80944114dfcf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_062320_528524_EDAFD742 
X-CRM114-Status: GOOD (  14.65  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

Thank you for your feedback. I would like to clarify a few things regarding the patches 
and the concerns you raised.

The code is not entirely AI-written, as you claim. The reason I sent multiple patches on 
the same day is that I was working on them over time and submitting them as they were ready. 
They were not all written and sent at once. There was a time gap between the submissions, so 
please don't assume that I was blindly sending random patches just to get past the review process.

Regarding the v2 to v9 revisions, I admit that I blindly trusted your Shashiko reviews. I submitted 
the patches on my holiday, assuming that Shashiko was properly trained on the latest Linux kernel 
source code. I also assumed that, since the PCI subsystem uses Shashiko for patch reviews, its 
feedback would be reliable enough to trust.

If Shashiko repeatedly reports issues that are incorrect or misleading, why is it being used as a 
review tool in the first place? Isn't relying on such feedback equally problematic? I trusted its 
suggestions because I assumed that the review system was reliable and that its feedback had been 
properly validated.

Manivannan Sadhashivam also advised me not to blindly trust automated review tools. However, he 
explained his concerns constructively and helped me understand where I was going wrong. 
He understood that I had trusted Shashiko's feedback in good faith. I appreciate that kind of 
review because it helps contributors learn and improve rather than simply questioning their 
understanding or dismissing their work as AI-generated slop.

I'm not claiming that my patches are perfect, and I'm willing to take responsibility for genuine 
mistakes. But dismissing the work as "100% AI-written slop" simply because I submitted multiple 
revisions is unfair. Humans can also submit multiple patches in a single day. That alone does not 
prove that the code is AI-generated or that the author doesn't understand it.

I understand your concerns about code quality, and I will take greater care to verify every review 
comment instead of blindly trusting automated feedback in the future.

I respect your experience and feedback, and I am willing to learn from genuine technical criticism. 
My intention has always been to contribute quality code to the Linux kernel and improve through the 
review process. I hope you can understand my perspective as well.

Best regards, 
Sreeraj

