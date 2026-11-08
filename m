Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACD3606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 21:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ABq7dlv;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=nmZLN9rU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qaMAMD5t7PsRjmYCSlDVMEcEPIkz6pncFlS6XYAgEbg=; b=0ABq7dlvZTdsSh
	Po5LMKG8UC4CTiZTRyMhFo4NLPpMQUpyHmrDzY1JRvSFFvOeuJXE+fFESBK0omd7rBzxqMwiAG8Pa
	PbD0JE0TI7BSsNIlrmdUF1f0t1bN8zDuUOGBR7iWVFAGVgy7v+P8JRPS00RJUhnNkoPjPBp/o29wG
	Hi5CpCTh6SlPzVn5xn/p4LD6oVTYRmqztDu2kZF/nuOXm4A2Iol6FDUzEW0BW2TklCQSY3mD7kN6A
	tNsjiw6+Nne5keDJSMTnfzTCFoHC11rrYKUI//Zwfqxu3wLtWskpcoHHqRpBsIAcIoysnFmzzYoKu
	NLGmKX1CK2JQhLMu3AZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA3X-0000000Gf7Y-2Pek;
	Sun, 08 Nov 2026 21:04:03 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQA3U-0000000Gf6M-2b1W;
	Sun, 08 Nov 2026 21:04:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1794171828; x=1794776628; i=wahrenst@gmx.net;
	bh=qaMAMD5t7PsRjmYCSlDVMEcEPIkz6pncFlS6XYAgEbg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nmZLN9rUwr9bA7F2q7M4R6WDoI/JyettyQPnlC0pG4pyOBQj1B0HAjnEz2x7C8zA
	 ZQDFfrm3XQj03ny7EBUcsmGGNSIbalAjI/InML95vpa+NGJfm8AenWHoZ2urWxaj9
	 rfVwKRaAUcSFrb6gRCSuvWmeXLkWjpz11EelwFDKp2LTnFdVDbuOuLivg6cE5dERh
	 wKXa0sE+O5/uhmKdkhMNTZ+W8CMDh9DvleLwNFaHPMyluXZya1DsZlui6vu8lVYnl
	 m1KZslrQCVQS+AXh9PVJgxVE2s1IsrCbkM/eZT+DcYkS7rFJ5OeCt19SXz8phim3F
	 UeXdzzfqzpM4KfRiCg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mk0NU-1wkCSK1WLQ-00ZNJS; Sun, 08
 Nov 2026 22:03:48 +0100
Message-ID: <2eef459e-da8f-4db9-8e10-2711730d92de@gmx.net>
Date: Sun, 8 Nov 2026 22:03:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] firmware: raspberrypi: Remove unnecessary braces
 in transaction helper
To: Sander Speetjens <sander.speetjens@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
 <20261107-fix-raspberrypi-firmware-v2-4-5bfe605a5cc5@gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-4-5bfe605a5cc5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jeN17wL2VBIYhUl575FhSoD4VxIiL3MR9co+jFU/tfdEGNrjB0a
 GjQxyth9lyfjudzJsW88ZZBqT6/8eqXjI5u0bAJBKCcYvJlWoUQu+1K+zpsUS9t0VqL4bkL
 CL3Doj+/fVXXyyAjZx9NHE6F0DC3MJ1rX8uYNNO3mtHUo7JEpguwih31d/4H0Ho9ef2UxVK
 2ENVZy7CkbLnL0Pp1ukVQ==
UI-OutboundReport: notjunk:1;M01:P0:BsqUcY7aAuw=;r3yC/5rORUNci0Q7I/TymKJX6Pz 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_130401_041234_D53C65CF 
X-CRM114-Status: UNSURE (   6.20  )
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
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sander,

Am 07.11.26 um 19:21 schrieb Sander Speetjens:
> Braces are not needed around the single-statement arms of the
> wait_for_completion_timeout() check.
>
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>

technically there is nothing wrong with this patch, but imho this=20
doesn't add any benefit. It makes it harder to backport possible patches=
=20
in future.

Best regards


