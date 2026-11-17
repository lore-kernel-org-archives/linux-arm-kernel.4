Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3BC606A883
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J8YJGeIO;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kp95F26U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ngfsadg2SKwRZORmemooRU9fe+LsEp8AELUWW3EroVQ=; b=J8YJGeIOgMv6YeF9I65MQKyNza
	eZAB8ztXTgczHpLrrsD4IvIwFnGUpsx121auLP+JiwqTg26SObd9RflJydsyCZmOib80oai+GD/rg
	qJ7J227z77vbfjGBh+PrSl550G0EdRYj0F0NYNSB8Z8GJ61pkMR3cmfBANj0npFlx1xpxwz/Jdnsm
	YY1OMqpLeH3FPYCL9mBLlICkphMUFDyUkmTnboakN/k5ilLLFpEsZXpSduHGUwgUowfXdkVVwc2Ff
	hsBLWEIcOKEsWOcHTrjlADf3wwCdHcQUGJLsnz/ROe6TS/1K1h5JmZdZOxC5/PlNkOz/XAnh9cLIQ
	g42diAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJop-0000000638p-0ZUL;
	Tue, 17 Nov 2026 14:05:55 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJoh-0000000634n-2mhW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:05:48 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5be58ad9600so8826e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 06:05:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794924344; cv=none;
        d=google.com; s=arc-20260327;
        b=l9ciG5JUXSFbuBzfQLZPQFftryUvU/9ED0aa45Z7BiHresicXBfizANANiCJvIZoM5
         /C9u9/Z87T+XGbp4bXOu35Gg7Z98Av00qRE1gQwy4jgo6fvAdDDbbrc63A7nd6WtHWhY
         ZINAqIPJ2T1NktB5PZlCTFi5t3yhox+SgRgtTCDMgP3JqBNOFesD4Zt6Vfkdm0UV9Suh
         /G1EB0fJhhtVdMjWvRgIcK+SzDUdSuiSkmcA6DKcZR8lDpXFqxQG57MexC70TlL3RxR8
         +4FXrjNOAjh61DNvpqWJbhdSqViwnxMDO16oTu3ekYrRWom7RzeVHPWceQaoK+VDloCx
         3SIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ngfsadg2SKwRZORmemooRU9fe+LsEp8AELUWW3EroVQ=;
        fh=r1feFnDXS2WYAkm5eoDidVEsytoy+Yz4s+jbGu5Uzw8=;
        b=CoWP6wQIWJybQZPTpTxWYWPgdcwi1+Itp9vZI4Xb6ZmdhxkYV7LY5dNpD5qPGTAOA1
         DooRw96Zcl9HmuuS2RKzPDBVwELF2GJjfLwKvwDJ5N1Wl9HTqF7QcK8JyghYSsY0mlHS
         C4eOz88+FT/EyU+zWisF0BaP1b+9bEcedY21SMLPxfP0TidlxtdL9QNqjD9WBwEsFqhD
         G+ZjETtVNvBthNEL0qN1BlGZ0GjLnHAMAsVfOvT9Aw+PpmBPxGlX7wxdpIgIhiJX5h3s
         aGH24UIvOecpCjR2dj975kvxWmSV1o4YUU1Uyv2qRRWeZ+IlTxHRr+DR2lPU22WvVIcu
         TpxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794924344; x=1795529144; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngfsadg2SKwRZORmemooRU9fe+LsEp8AELUWW3EroVQ=;
        b=kp95F26UDuDd0HoFR15oKgL3BtaIz/RJ2qq3MPz8Qwf/yROd6jdwZDisq661iD4IUC
         n/DJb8OEXcPdt/q8wpIH06Vrn7+715OdBdtjPMLLH4DgWsoRwhfayyWzVNpq0LEeX1iS
         2SDwAX7gINRi5tZomL7OYtEOHOjeRdYsX6jdvJgZ8BvOrOCrTHJvECBG74W/8xL/WCQ6
         qoGgS0A+F8sueLCBIC2qBSXUl2Pxvy0dY5glUbaswPAqHwJInla2pp64u7uSHpaYYYSv
         QB5LoKpMMH3vZSaJMrTMwbtWCpI54jdWZza/fDjvD0jjuFAm2HbhiO+/BZJk3WpMS0YX
         tSlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924344; x=1795529144;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ngfsadg2SKwRZORmemooRU9fe+LsEp8AELUWW3EroVQ=;
        b=PE/oF7MqSpz1MPqQQ0EOKDHrv2he4bW0oKXuZJW29b7WfOFeVNASM/Px0oJJkqCC8Z
         uXsNAx9iWYf/1ZPYPYJF9JLRXnfI+K3LIh3ReLjYGLOgz57hCAzReiYVLjV7O8R2HVZ2
         voOVhD3WOi8YxBQzN0TjvWhER5HagSEvNt4j3stbR4xc33YUPPCV4wqSuMwY2RzYmHzs
         PJVXWtJX4t6R/QXBGcY50liOQ7PRgsCBYb4du6jTWaJrCvdF2wo/tYUF25Zw3Nr2Yfy3
         UNVoI/YT+CEJ5Mm5796DFl7+d/kgRtCP774dkTUq5CH4ehQ+vwj9eYk4MlcxjHa5E8dY
         9FaQ==
X-Forwarded-Encrypted: i=1; AL+hErGq8+go0+3E+0+xhRpb+21mea87ORjQLrOzbqmWTSscarZIoNCQSn2IKIJoCxyCU9pmtPXym1U3JvEjU/KSwVWz@lists.infradead.org
X-Gm-Message-State: APuU4Z/5gzhGhSdR27hNmN3wTL9b6u+auawYP0hvzV9HWeg7IcKsfQiV
	n/Rp2xofGQoOU2YCHCH754BSOKpM2/IOyYg3BgeNw3ALDIFZZ5P1DS31f/5ksFRGYtUjT4M9CWA
	nD0xK+IUKE9boxtv7fGbaGOe8QnGMFVThtcOy2L2h
X-Gm-Gg: AYBFou2f0eMFaMyWgztl9Rmgy+53FzBhB2j6Kt9raikjGOZnK+mjCJ2BhRvy6UdLOR2
	hJPitO+K9CUpEYGOKH26RrH8dMJfsZPn6Sr4NadGoIcznIfht467oYE2X7qzg9cCabC4dDKY9hL
	FDfa8efeqVOg/f+CiuFyJRVX4oQNl9gfJKZyG2zLDaD2aENwt/BdGuyOlic7vv/DwU3ZOMNrgve
	8uqUSPbRDE7xX81RHYkbbmGmAYcqmxmkwXt1j6+19aRS0Ult+z+JPYAJ7uAZ50oGpQtAIoUxrlf
	KJz+3H4WOPRPqRMZuYWtpKzg5eVDZOrXwLXSvhpx7QWZpRRi5MeOwbw5u4EUC/4RarWB72apqKk
	algpQBZ9V0pk9+CnkXDDHPFEavpVvYuHRAlO/yoY3kwSDl4Aq/cXxCQfxKxr/jz5GCGhauiTOuw
	ls3IXoGz9aV66WRzjutg52hrE=
X-Received: by 2002:a05:6512:1111:b0:5c1:4f9f:1ae6 with SMTP id
 2adb3069b0e04-5c1a217f086mr131117e87.15.1794924343575; Tue, 17 Nov 2026
 06:05:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-2-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-2-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 14:05:07 +0000
X-Gm-Features: AclHuK9jKHIPqUkK3esGB7IzhXZkIYCyUzZ9ZlR4n4bgSHCJJEi20GuUOPH-oTg
Message-ID: <CA+EHjTy5xBmavNWSYPjqU9qXtssV3ZHzsUr1s_4bVOt1GnDLVg@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] KVM: arm64: guest_memfd: Check mmap support when
 preparing memslot
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_060547_724264_3728305D 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Steven,

On Mon, 16 Nov 2026 16:43:47 +0000, Steven Price <steven.price@arm.com> wrote:
> Check the guest_memfd backing file when deciding whether an arm64
> memslot has mappable memory rather than checking whether the slot is
> gmem only. A public helper function is added to be able to reuse the
> static kvm_gmem_supports_mmap() function.

nit: could the message say why this is needed? It's a no-op until
patch 8 defines kvm_arch_has_private_mem(), which makes every
guest_memfd slot gmem-only.

Cheers,
/fuad

