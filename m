Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66164606A337
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZTLjaF4K;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mUg64a7U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NrKgzfcLZFljaKhwZAHVe0DSjWSfUpDmRRp+D9I8Z5M=; b=ZTLjaF4KXhryz5Q4tMBwH1ed3y
	W3dC+FBfDGh/05aFX2PoXuj8kuDrvrvgI8gdngXGX05UN5eMxB2i83swHuxti7deyFLg+gwmZlyon
	ck7/+Kq5z1c91RPfy+4Fs76R692nvjc8WgDwEsi3aX+RRmqAZzBHRLuE7ldT/dhGsiGv627EvRUX3
	Y2FvJg8TrIimLiJ4Zuy40dGbmipwtYTuGDwkmjpujF3qkaZ/kICVg7NrPcaNXE9fzT6Lg9YmNq190
	t9ZsZrl9bwOvPNwl3e1P4+Cq+x27iesVn9H1HcJLNH7uHAxQcAs/qKCnyY+5mHkHyWCYLKo81SlBM
	dxNMHOXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW4c-000000040pf-1KNs;
	Mon, 23 Nov 2026 15:35:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW4b-000000040pE-0aOi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:35:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 60996622AA;
	Mon, 23 Nov 2026 15:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1F8121F000CA;
	Mon, 23 Nov 2026 15:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448115;
	bh=NrKgzfcLZFljaKhwZAHVe0DSjWSfUpDmRRp+D9I8Z5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mUg64a7UkZwIbJ8HajTqlauh9v4J6st9Ev173OIHS3l6CBfz+3ChN12Hg5qDqpM2/
	 SycAiy/PkMBtodaeZvL6Pjhcq7EXJxBHQOiuLS46gY2Q/HGp7vWd6hHZwdI5DR2Hse
	 WXkB72nQv59nw7S4RkNHUWEPqgCn/L3VKL4Bx0KlN41su24+LZQywhkpjN5pqxhZta
	 RrkRA44WZEx/u36m1OBzeu1O+gH54a3KZ6L5IWruRVOH6XEa+Dx5yQ9O3oOsYM6gWE
	 6cEyhav0eT1A5KPBrrcBTDNZ8FV+ld+UpaMNroNyQWMgiLGoZ66NiyhYOxaxEOZxA5
	 ouKg7PRjrmn+w==
Date: Mon, 23 Nov 2026 16:35:12 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v12 4/4] arm: multi_v7_defconfig: update the Qualcomm
 Crypto Engine entry
Message-ID: <67x7gbbhew4xkqhy2wpg2pqjges6kbbswlgpuxhcjuzaj5jtm3@aseuedq5zf5z>
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
 <20261120-qce-fix-self-tests-v12-4-b5a2a44bc5ae@oss.qualcomm.com>
 <e3d2cca6-056f-4ce1-8701-a2592b18b729@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3d2cca6-056f-4ce1-8701-a2592b18b729@kernel.org>
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 02:07:40PM +0100, Krzysztof Kozlowski wrote:
> On 20/11/2026 20:34, Bartosz Golaszewski wrote:
> >  CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
> > @@ -1306,7 +1307,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
> >  CONFIG_CRYPTO_DEV_ATMEL_TDES=m
> >  CONFIG_CRYPTO_DEV_ATMEL_SHA=m
> >  CONFIG_CRYPTO_DEV_MARVELL_CESA=m
> > -CONFIG_CRYPTO_DEV_QCE=m
> 
> I don't understand what is the base here. base-commit from cover letter
> is unknown for my tree.
> 
> There is no such code for half a year.
>

What? Base commit is just next-20261120, full hash in cover letter is
909ef7a9a30fa139e69e555e3606680f5cca7726.

Bart

