Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2420A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZopSRfRX;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z8KU03/N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Qy2W2pvIFm5oV+ggmretEdYl4r1/nuoo7/fZPnbNE0I=; b=ZopSRfRXL0E0PtVjkXN+QDeFgi
	3c3UO4n04HFh4Vb032nUtp5qDZo8Gry+k3miutP2tvuf1Jonv0MEn2FXUEu88K+AZJqtH2HF/OLfj
	JMrW3AH8tpllTGCh7U3fhdLBdtfquKq7XwVSpx3AsXm9YWsBgranTXRSvNV1PKHSzctysSkrHyemt
	pe78a8RIckTeG3PIxUWMFXC/bouHXta9LqOHL7kLFxugUINUPj8naIowHiU4ZYnmJ4T5sHauRdvJP
	5O5oIgeOM/eelAmRLccL4cQk8nwbfpOrSGJLHe4j/qnHfK96xogAxsHfRVb3wK+CpV6x16soBOngk
	jrUKRqhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4cv-00000006B5w-1npi;
	Wed, 11 Nov 2026 09:28:21 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4cs-00000006B52-33cE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:28:20 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5be58ad9600so3238e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 01:28:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794389295; cv=none;
        d=google.com; s=arc-20260327;
        b=sWTCRhSZNtwC4Ter9WY6+k0Ltg1VRX9I6wImW3wRFfkkgYd4qnyLHSxoRHyqHeY7Qz
         y1JYbabNC1e2KDyxLERNjwb74wzOuSn+TtKXfAjS5EH94hCgz6mxEgziOu//bEcfvols
         HyGbXlB+BkF21PsLB51U3bglAEGnIEFmH3KlE+Rl3MowMOptJDWWANJ9ZYbNPvTvb+dr
         pLzHA7B+tsL+dsSBIxkhh8ldO4p0s5/a8uL+kszzpm9BNfXw0xJDghMLAtxIPd1necU7
         R0E1byC7Aw8VOyXezhml4jNwXUEAifvoPX1I8qFMT+zp52GpcyuDkHNv627shdw2m7UT
         KpTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Qy2W2pvIFm5oV+ggmretEdYl4r1/nuoo7/fZPnbNE0I=;
        fh=NG+yqijRpzkO5eiuEP8MVOgQx28CowEtznZF2yfBxA0=;
        b=CqDgKYlsE5wZXXylgm82rtwN8ueg1xU9DO0Id0KmLI+jS8iwk5zrFsbmHySp4PUd/2
         mWwnXoKRQMuDktYNrl0+/29DQqP0KwPdMtFUH+N7DNgiStbwJOJFDPCfLfkSIw8LkuRh
         l4uiqEMZeeCI4ROpswei7Aw9wr4RuAQpDIGSXz4P3BzXtqpQDNMvgPGBC1BgjAJ4EW2e
         oYWMjxbya5kCTCXzapKRXFjkwYtHeLnqFpcFqMuvpkxaslOR9NTJsUC2OPL4Gj+FCCdg
         QbQTWk9V6xb4BaOZNC2PdOdaCJ3RNhDYXB7eZj3+d4C9RXjMXyc8E7rJjfCl7E1VZjGx
         SvFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794389295; x=1794994095; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy2W2pvIFm5oV+ggmretEdYl4r1/nuoo7/fZPnbNE0I=;
        b=Z8KU03/NZW8jHBhkBrj017lmZnSXhu1m9IGA9d7kZGkVNhhgavTjT57fqLQ6CDNlkN
         e6w1AmtcbmhzOLTw+fOU8UFD+VjPFxCQPQXi7lYiazkwi3LdYMHBkT5UK2N9Su0Hv+/Q
         D+DSqe40DXnq07u5cav/f97kJ0uoG7n9LBiymYV2tGl8t4k2RetDNCl3vGhyDDboFiRd
         e4R8U04jf3vsfTQzIZF4OcDB6AmxjeFe0cn/CBLrfOPUbCWwbnYSnUImves39QfSzRtH
         PaWO4121C0QyK/sHG9fFRQPcnqSVa2aA+c/UHPMlftM9NJcJP4fFmd3te0s2o2geJgkq
         R7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389295; x=1794994095;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qy2W2pvIFm5oV+ggmretEdYl4r1/nuoo7/fZPnbNE0I=;
        b=eMQzZtwFDnKzX18OqPFi9HkgrAIf02YoBLe0P0RGacI/wGjnL/0cOMvhfrLpsLSEi3
         xmAX3/m5NEgCyU0KyNB1ZhM+HxQ+GfEqHCa05Xcc1I9bnJE0w6qr6Iwm53owofSiDG+j
         KAgrY2jtGGvbnyuhxu2rdsAj4oR9F71hih7yDFnE70UP802hbgsFTPIcSlm5IsuRRKyB
         7KF7KvKTWUWiBMh1eDksU/+EvwVB/J3m1wSjBb5Xs3GhvbYMXXzfvsoUBUO9hjlBFqEE
         jtZKxH/0H8nvWUjpZpzstkrEgFA7WFuXW8tJdHlU526BqwWxqy9iwhveORMiry8VGfoo
         AmJw==
X-Forwarded-Encrypted: i=1; AL+hErGsaVg6QScN+KtEJJ60NTVvOH5CpJdJaN9XlowMfC0Tp0Gak8zpRBlKVapKZByyPPqOp3z7L43LZ1G5Pr0ka0Fz@lists.infradead.org
X-Gm-Message-State: APuU4Z+3ywmWOk7+NFlYUqgKYOwwH7QUnzWAGvo1QmpPLl/grKp2jKDb
	LRQuWCpExZpIlu5qMFSmH/iRf7SZeVtE7BMf7WebXonD4qPAQnyiSqCJA36SQKVyfQFKLV6uhd0
	3jurO3Q953JhuR2KqBJYtSOSPa99obNbce4i8+zih
X-Gm-Gg: AYBFou132wm4QsJTrP88zCTsC4GwKIIOFzItlPsMFdaXXl1uUH49v6zXslm39Pom1Xb
	u6EqjKr7RMKq8AGnvoA6/9YE4VyyDjpgKJTSyWyI6oljSO4YOAFqI/j8u/wQdtu0Tt71Zx6COy0
	TgZC4bkQjVG1EccnyZMGn8b4ffr1Xc6QOG+DaMl9YEhvD2zZwQCIf2q9WUi2gwJVwd7RuLrT8kp
	wZdRG8Nl2HIis8QKv7LGu22oKPvNs/W717dI3jZW59oL3Gmj+oldb7KwUIfyb+NONOlT5HQJtdo
	/Sg10VrsZMwLPAFXU/peMb9bwijCbS6NHeCMWx91SfUbpa2RakHZJNfIfPUzX8LXfjyRSEh1NlP
	dP+T9tIN3INlynwXCW3sfhGiKGwmhsaO9oloCV1Twv3ndlwvgiV80am36MKEvT9GpsGnnKJIq1h
	rGQhGnrZzlURRS1sLrxrvCACFLqyo=
X-Received: by 2002:a05:6512:3054:b0:5bf:f0fb:2c9c with SMTP id
 2adb3069b0e04-5c15d3f5907mr122518e87.5.1794389294930; Wed, 11 Nov 2026
 01:28:14 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106120221.347309-1-fuad.tabba@linux.dev>
In-Reply-To: <20261106120221.347309-1-fuad.tabba@linux.dev>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Nov 2026 09:27:38 +0000
X-Gm-Features: AclHuK92SXm3ynhwC8hX4lWiOmRu9vrW6jGTgAJ483QcpwVLwRbURSz1gBkXer8
Message-ID: <CA+EHjTxFQ7GfTKhT1D5SYG6wyfqvifS-tNY_dSb1qWLcaR31UQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] irqchip/gic-v3-its: Fix how zeroed table pages reach
 the GIC
To: maz@kernel.org, tglx@kernel.org
Cc: radu@rendec.net, lpieralisi@kernel.org, steven.price@arm.com, 
	suzuki.poulose@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_012818_780661_E42D048B 
X-CRM114-Status: UNSURE (   5.93  )
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

Hi folks,

I'll respin this series and the ITT pool fixes as one [1], so please
ignore this one.

Cheers,
/fuad

[1] https://lore.kernel.org/all/86se1720q9.wl-maz@kernel.org/

