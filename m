Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAE9606B204
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 18:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2If6HK5V;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ip8+Ck05
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nqq2fVahmDvYhU4otqdzJt7uhBld6iWpTWhwJ5Rm+1M=; b=2If6HK5Vwk8gLP
	5CVKy2vPq++gPUMo7NxvhltaSe7Gcnap7ymkMHYnrCQXeNIEMEWq9l3WJImWIyavoRBHJrpaLjLNn
	h4tzkfM/QXbuwep5OHnGSWHNsq+e/6KrmAcUktn/xAisjIZcg48iOc/Z0E/9ny+eEbXQ1erJCo8Fz
	NX0B9Z5Zbn+9bEtD1khNdeTwSrVJdoF1NkvLFEmRNOPe0sm8j8vZuMD5sKFJ8DT3ZtUjHk/ZxWIth
	tOQMQkzApP0NNP9v9XHAd8CBC2dmnej8mfIhRV+vnW5cJZwjwGrzQqCxJJS/J2+S5h720q9OwimCD
	8x9D+rxndvUvts0CKPXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvrM-0000000DuTp-0iDn;
	Fri, 13 Nov 2026 18:18:48 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvrJ-0000000DuTI-2wut
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 18:18:47 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso650505a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593924; x=1795198724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nqq2fVahmDvYhU4otqdzJt7uhBld6iWpTWhwJ5Rm+1M=;
        b=Ai1DLMoP6idTrjCYNlOGb3BCxJe744i7lAv6Rw8qxT4R1k3kKukXwbKcf2yzRZirkq
         EpUdACzzbPKeJbBXvIB3IgvmNUyHMIUE1x1bEDY5jusuetv3celsUg0RGXwQUGih0N3A
         dozocSh0vMM0VX1q9sqSd5/P/ehu9gbGyH0x9KKUEL3zu9AqXm4Tzi1/Jw2Rqt58V4w2
         YxaQnVA8tK+1gr/6X6FpUlAvrQ/lLA8mTSc0Xm5BRY0/x9Vmbvk+ViiTsG6vwIBD730i
         633YeucEJKEGJjJjuOYiShANIrfSpIx32D1EA9d+G+L5Rb/6QIbgBvsJlLDkk6W+mM5r
         0cFg==
X-Forwarded-Encrypted: i=1; AL+hErE6IelOe7T833Ikc58AszdlZsyxPEk4QacQ43ze7AYaQ8ZrGVd9QvNoQYDjcyCWZ1Z/MswfE9MFGOMjnhWGfUo7@lists.infradead.org
X-Gm-Message-State: APuU4Z94Wql5EnKqdxVE9x71YG12cKK+FxtQl5hZRveyDKovKFTZTgZM
	Q/esz4Y3bUST4jcioXVa5piNmgKaMG4stDnnjxsNVhVP2qQzQMJH2nVRLPbA0vOaxVKhgBNbstQ
	fXob9Qt28cipktFWGcUtR2EUqTE4NsQKTuj71ZEvlRuLtn/D6biO0tM1VFGB1fBMBkID4itgZMt
	mFPWF1KukuxkTLEzG+FbKYHT26VJu4PJY/tjacXaI/H3e7EBvKGl104/CAuhrDrN2HnbS3nq30Z
	jU/az3YC6PXGt8AzrUXhspVz/X6gZHpGmM=
X-Gm-Gg: AYBFou2Za5Ec1qQfkTKeFNrBwW5vC4ucpvzQjBz1wb+4AhvKuLQj3DB8M4SiEIkNBwW
	Pbd8TndSPt+dG3xombazEoMdzfPL0s3rdNPbGFMxngjN5fmUD0kzMkXLZ8+4VA1ORALfXICsUAQ
	dozuBRRvxTMVwo/7BEodfF+nW2xmxqjsiWW9I38s/kDoGr65c1hDMJjuJxRKWykjwdv563ZAfxT
	gbFIKlU3QrPYk/74x+Z0XeewKhjtbyZq2AoukKQanODuI0K53cys2nizynD2YVqTMJXTxZHU/M/
	X2hkpvGHqHF3Jh3ULGcOtY9ZmTHAzW1VghdSJNxXA8h1GXRSf217yFm6aQpVoWPXQjjGRiL6oYs
	Z+oBIZJBCadYckd9cOXhido8v0lR8osirlgeus8TEq9jvXzeKoi3UGkXIfD4/6ZaIhCtype5DBy
	UAKTv8tLy3+c+Cy4V/8qJ77a5F2bu222ZFRpKBMFrF
X-Received: by 2002:a17:90a:c2d0:b0:3aa:f2c4:12ea with SMTP id 98e67ed59e1d1-3b1b0a43396mr2854284a91.20.1794593924184;
        Fri, 13 Nov 2026 10:18:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae96f125sm4863111a91.4.2026.11.13.10.18.42
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:18:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495c71055bso138580785a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794593922; x=1795198722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqq2fVahmDvYhU4otqdzJt7uhBld6iWpTWhwJ5Rm+1M=;
        b=Ip8+Ck056tikx3vkWscZ+IU7o+vPZF2g32hHWgnXul6Q7Kz99+2huKq33vbAiPEkcv
         ZgA0AT0DKD9ClYMPvOmKocqnhalw4wnYmeHTj32j+cVieW3cN/6DHeDrbqwgAOaq3Y3L
         4BIx8dGF5tpHoh3wURZnP5/wT0Dl5CKAqXS1c=
X-Forwarded-Encrypted: i=1; AL+hErHq1TTM/qZSlrXtujARHddNG67i5xcgrENFVE7bEQ2o+BNzcQrvplBxeejvEyGodfOT1miQk+tqQwzZx2hcHoQz@lists.infradead.org
X-Received: by 2002:a05:620a:27cd:b0:93f:167e:d990 with SMTP id af79cd13be357-9494bb94556mr556607685a.50.1794593921901;
        Fri, 13 Nov 2026 10:18:41 -0800 (PST)
X-Received: by 2002:a05:620a:27cd:b0:93f:167e:d990 with SMTP id af79cd13be357-9494bb94556mr556604285a.50.1794593921481;
        Fri, 13 Nov 2026 10:18:41 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c6025f5sm237554985a.5.2026.11.13.10.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:18:40 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	torvalds@linux-foundation.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Scott Branden <scott.branden@broadcom.com>,
	Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH v3] MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com
Date: Fri, 13 Nov 2026 10:18:38 -0800
Message-ID: <20261113181838.594023-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <510bf9b037c522ccfba270926c95170291115ef3.1793602003.git.jirislaby@kernel.org>
References: <510bf9b037c522ccfba270926c95170291115ef3.1793602003.git.jirislaby@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101845_748949_8C1677DF 
X-CRM114-Status: GOOD (  11.41  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon,  2 Nov 2026 07:47:06 +0100, "Jiri Slaby (SUSE)" <jirislaby@kernel.org> wrote:
> Both emails are bouncing like:
>   Final-Recipient: rfc822; rjui@broadcom.com
>   Action: failed
>   Status: 5.1.3
>   Diagnostic-Code: smtp; The email account that you tried to reach does
>     not exist. Please try double-checking the recipient's email address
>     for typos or unnecessary spaces.
> 
> According to Florian, it should be first.lastname@broadcom.com.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Link: https://lore.kernel.org/all/688738af-100b-48af-bee1-4bcbe4422f94@broadcom.com
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Scott Branden <scott.branden@broadcom.com>
> Cc: Ray Jui <ray.jui@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/maintainers/fixes, thanks!
--
Florian

