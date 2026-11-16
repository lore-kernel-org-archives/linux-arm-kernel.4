Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D36F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EKzw7aG6;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=F5oOv747
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EiBM1lw6jtHc4Msd9f0+IoWSCWSW1EA52TQ2PRTxuNc=; b=EKzw7aG6iy4laHzfCTgFlU7Hgy
	57pvLJkwig5GMO423MLdtIOuWp0HksD+6gUfM4iNM1pJvsVUcpyGDlkJiXvvmwoeotpHkDdoGdEtR
	DVcHTYHbEzHARSjzJuGP/IyTbPqUbVxh9AmFYPgIWCXgwLhPFLXETMpOK0Okwu4WNXoeO5vkSxk7C
	Ssqp4x0CeqJGiknZ9q4xC+Qxqv3tFSm1dWPf4S3TBJ28/t4BzREePPeZYyOZCk2Hlwf3/OED2rOTN
	/wr3w8ksin+oDMSfAD9ihPfP+5fyY8InrVamrmbQrvMWC2tvlvwb58aWUShD/xTeaIUKrafSa9inZ
	8Q3IyMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxwJ-00000002vWv-0lTx;
	Mon, 16 Nov 2026 14:44:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxwG-00000002vVc-2PEc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:44:10 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so3807682f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794840246; x=1795445046; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EiBM1lw6jtHc4Msd9f0+IoWSCWSW1EA52TQ2PRTxuNc=;
        b=F5oOv747s6SsjAdnXXXx7QcKlnHMv/Jfcx4zwe05xP9gPXSDH05Z20Se2zP1TASWUH
         tCeQcoDs2DM4oH3ThPU3JmJwVHM930eETAzczdM2vfDAIAC3nq/D84haJ+64WVcF+5fw
         tc7doc+ziVD5LtbsO2oE8xz3KwxhPbCM41DK6IqfuLOqJNvNPL5Hx1p5aY6HM8uyd+RG
         jPlb6rzHJowVUQoQv4yVjQgNLIAeZ1jQJE43SDlpNkXZNpV1CHJ1BXhcUhibMvAIrVwE
         GzICyFRCSRRqGhv1pR/fadPKLD6ISq7Aet4/ipC2MKZRW27rHs584/kHpPYE+RdryjW+
         fH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840246; x=1795445046;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EiBM1lw6jtHc4Msd9f0+IoWSCWSW1EA52TQ2PRTxuNc=;
        b=vfiEJvXAR1Q0HrKKPxEcs/TrUcMTdPT3XQtLubBJ45U3513j7t1IAKHRTU3OmqkAfh
         Vrx+pq7bKceglDEcLBxpYlNoJ9YevpWYfHtEGQjDWNeJZTuJN1Zq5eVy5ZBZMgby4TxE
         yXubADPhyJnXSODqrLJHoehQ69i2p5w+1r4hTmON0KhCtH2O0w/xZvMnZXWDHrRMzHES
         UwTkJZcFasaDlQD/dOEKjhVah3ZLOA2LE5iVgCmoqY+KpVHxX7rZrXnbkWXwc5pmqjz/
         dtpWHspJHSufhOm/kh7y12HMEDaa9TwYLUY5P2qlaz/s44wEwNEqEhk9C4W1ON+626cw
         Sm6A==
X-Forwarded-Encrypted: i=1; AL+hErEhOiqxZVI4hmKJZpc9CRK8YfFLA4AfCJnM3NNEHp+dpT7c6HXRoraUuFP4Qmczub9FZlcOqOHnItDRnpniwwGs@lists.infradead.org
X-Gm-Message-State: APuU4Z8qoSPh2JV5/5lOlcvvblt0agPuQhz9B7T98Vp1vJC6+L2S57bG
	nEM4a7i44TJ6rnfa8OgAY4zKtuk8D/JpC1rf/+UqnDWg56SMpMr6cDQsROoYvwo1xWM=
X-Gm-Gg: AZFdTZcYfWmzVmKjgz+hDNvGgRJBF9MSf/MPT0uOCd5LkbPvdSeg+iBv/2YFyAYeRWx
	uh11vvqLqC4ADH2XIXmji9+F/LYHJ7uVD7keQ3sdPs6OkbB7ALTu5gYjV7QpkVRC1NKkdYzHN5/
	XOf0MY4Jd16Rj6CqMCt0QTIG+M0anS/EXD92tVbiSs5ptOJBh+3AMGG4g8uiOCyooyuBHS16x9J
	NgJgRo29vlBuaFxKeUUfT1z7W5i5X9UjYvSHuHyh8mMiHB0GzImDxQYGLH11MLGTxeKQFnVqLjf
	EzMI2RHiWVnlzWpQt2GkLNkg1iXe6FCMTk8A4HjTYNZ/37v24ei0w909kyD9MfQKc6VzpmBiU7q
	FY8Wddf6waaBTJ1+FDuC0xHOXStWK+lYbUUCbMcf0e2qRG5k5mjUrAnfdoGJicAy6Rah3wrg38k
	XRB4rHvfafrRKa2U6BBMbWkPdo/jv7As1sQuQa5gYbXzYewt1B6tNJX8fl5hS+VjvP5xA+NBk4+
	FfbCoBPOzrn9VruRsGsN2BNrZAi9UfIAWKt9vj4SNor5M6yOblssRTVIxWHE2HjyqSQQQvvJh09
	+22MiZmvfPFvy+Vhax3dYt03Qyni+Fy0+lkToTt2Q1rvNhKmI9T70QUsj4bGxV5m
X-Received: by 2002:a05:6000:46db:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-49c73350e60mr16833660f8f.49.1794840245956;
        Mon, 16 Nov 2026 06:44:05 -0800 (PST)
Received: from localhost ([2001:861:80:deb0:b65e:146c:107f:26ed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm24003588f8f.52.2026.11.16.06.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:44:02 -0800 (PST)
From: Julien Masson <jmasson@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: <linux-mediatek@lists.infradead.org>, <lee@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <kernel@collabora.com>,
 <wenst@chromium.org>, Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
In-Reply-To: <afc3ec2a-90b5-440d-9710-2b3892b01b6c@collabora.com>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <179239867012.642420.15110854236483587234.b4-review@b4>
Date: Mon, 16 Nov 2026 15:44:01 +0100
Message-ID: <8733t0ygy6.fsf@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_064408_622407_37B841C1 
X-CRM114-Status: GOOD (  14.99  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

The SPMI sub-device series has been merged and is part of v7.4-rc1:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10c833da4dde3d9bb19e2092a33abafdaa16a341

Would you be able to send it in the coming weeks ?
We have customers waiting on MT6363 support for the Genio Pro 5100,
and we'd be happy to test it on our boards or help with the remaining
review comments if that's useful.

On Tue 20 Oct 2026 at 11:07, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> On 10/19/26 10:31, Alexandre Mergnat wrote:
>> Hi Angelo,
>> 
>> I'm working on mainline support for the MT6363 MFD PMIC.
>> 
>> Are you planning to send a new revision addressing the review feedback
>> on v12? If you don't have time to pick it up again, I'd be happy to
>> help address the remaining comments and prepare a new revision,
>> if that works for you.
>> 
>> Thanks for your work on this!
>> 
>> Cheers,
>> Alexandre
>> 
> 
> Yes, I do have a new version locally which didn't get sent because of the SPMI
> series (introducing the new helpers) that didn't get picked yet.
> 
> Cheers,
> Angelo
> 

-- 
Julien Masson

