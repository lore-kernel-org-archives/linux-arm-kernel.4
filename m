Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDA7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 02:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1CQrUrkl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxykMlon
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MXJ3yo+U7Doz0e8n3cFxrPAtyC+QNHJu/0qF308IqpM=; b=1CQrUrkl9B0KId
	JErVSll5TUn3MpY5aGdN0ugfQMwwdfHDl2S8wJ60uQfOiJN5FklvlOVhVPcMe0VhPHR0sMyN1e4Ku
	1reeqvlP3UQd3vNR1Rci+s5MDUBA0TN73PExcnTrkPPAoEcIoZ9oWGP5ZTPUrluOIZFqPAwxzqeaH
	XIByq+jfLrqYzcffEb9UJfhFOLa8ZjxRV8SK74PUjEzpxbaDUL39auGae4kqXv9J9Q5WYqUKfI6EJ
	U0t72BdITEW4SU33wbEe1yEJAzou4hRBkG4fhOeFVqgHc1h59Kzar7qn7/ndiUtrQ389gpjZw2nsI
	5P0XEY8Vt5m2DBGVao8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbKu-000000028RU-2R4x;
	Tue, 10 Nov 2026 02:11:48 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQbKo-000000028Pf-3utV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 02:11:44 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-70b875f6f1fso1142866eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 18:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794276702; x=1794881502; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MXJ3yo+U7Doz0e8n3cFxrPAtyC+QNHJu/0qF308IqpM=;
        b=hxykMlonIY6EBbWCZhTN3pCU8Wn0aOdJAymrnZyhSy/UH8JtAeO6vdVZxBCJuwht/w
         oW241NqfQaAoYvESrOFTwHIp8iQ6nRCCXKvMCggMxHc7X+T0CCisDMg1fFe6xDNWyEx6
         LN3L+kEow7qePSVaYOjTzD/tbdzUJ55FzbYCeocZDSjrVv3TKMeFgB9rPMqJ/18cszRq
         X/iWZcwWCwHJ6LBzvaeQNMxhP88kZfVMT+06cePwYK8/cDXZgU+Xnmt7giL1pc5hykQU
         xijbz3mNbrRDAOlNLtRiR7EWWtlstV/U45JjZ4jyWligqpsVY1PviG73FE743PcEZ9LT
         1/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276702; x=1794881502;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXJ3yo+U7Doz0e8n3cFxrPAtyC+QNHJu/0qF308IqpM=;
        b=Nk+0RckjN2voSA4QBaTfhN3/mSycdTI+fR4xW3zJFqQ8yFgseyFiGNFTkX+m4rMBGf
         bJ54jstRl5zk3hwa6ogVSzzmVJDrZwpARwJnuWMOQPtb1I85dy+B7LmFs9Wn7XlCSvSi
         fNlV31AOeUj5LFCJ+y8MOkiytwamQ1XV68zipvdsQVUpmEU6Prb3u7/r0NQ+1WQz6k+B
         4KtlZLfgUOQrJcQW3971aKK2UVTJRTEhY6O+LKMkT5yL2OEayQLfzd7JnjvaxWkpaGqi
         uccBAYMCjBi46q5nOwRlTRbnrMkzp1KB1uVQcvjNMkuKK2fWHYapyf34oYZddGL6KVc5
         nfbw==
X-Forwarded-Encrypted: i=1; AL+hErEBeJcIiRUSSGYMDIUMgjA4CqTl1FVUoTtbfESXR4o+mQoXauqwSX12kJ8W9Ypam+RQKeBHvf+iesAxTOIyVdhC@lists.infradead.org
X-Gm-Message-State: APuU4Z/TcLJWTFWn8NsFPKxFCq6eZlCJXDz7PdkpyngXgTuIdudDeUpL
	wWXKgqU//PjtVFvY35etz2f4PDZpIewVr/7rpxTj9ZVMPuBDIKs4fC41
X-Gm-Gg: AYBFou28zYR+76YZWG35AC/qflZ/3zXxOs4bRNM7Wg8yuR5QBQya1LO03BqiyXdxIHQ
	k7ur6MR1qsJfSSZ/PlsUbplgspGKVlx9KJ/XbpnP64F4niPe0lLqBVf4JLl50qvU7o/4hAsJJDD
	0FUy7SsRz06fPzMgaQ1DaVZ/4aiYpmHMvDWUM4BI5G3MAFHZpcwo5hLKbr2bPlJhFqRKdq+hMA4
	zFoxFdULem+w/lclcbHSiJDW9/DJMjIlJKEW/alzmkmvlgtpm/PwR6esrRMHEG6qkJEf/aFKUUE
	Fo03TuEuUMW8dXvt8bB/Aa5zk4jU+1mk92Cyxj7t0kj9FDYC0Uyi9larI5Vmbhsck9ypspWyl8Y
	QM2CVSzRUwwiAvE6bDc27Gk2USha1v4wGibS9LVBm/rA/PImKBN/2CnFiXSuoxTspgk6X5NxfJ+
	CXXRY6ZTG3wvfyS6Fmpa6+SFx6ILQEqFxq/xfHJSbwdEHTkQ5pEk01zEaulLRBPqD7Cvqs6cVno
	6t/NT0mhH6+yIfjG2HMejNBDkyc8BvFWl3Fh20UP8TEIrlxPXQ05gPb3gK/z+jHqA3EF4VGYOov
	zYlqjMRJ7gVFYad5QrGI1a2dDNWi/UZTdIO6+6Q9sUGdNCjm5K/N/DEZ3JYaRNcSilTUxnfdchb
	qOX92Zg==
X-Received: by 2002:a05:6820:f00d:b0:6f5:a49:616b with SMTP id 006d021491bc7-7189e73a44fmr602567eaf.0.1794276701742;
        Mon, 09 Nov 2026 18:11:41 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718aa034ad2sm663402eaf.13.2026.11.09.18.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:11:41 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: linusw@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Mon,  9 Nov 2026 21:11:39 -0500
Message-ID: <20261109-a733-pinctrl-v2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107000135.6b684277@ryzen.lan>
References: <20261104-a733-pinctrl-v2@gmail.com> <20261107000135.6b684277@ryzen.lan>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_181142_973005_DAF1EBAD 
X-CRM114-Status: UNSURE (   9.08  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andre,

> I guess this has been written by an agent who like to talk?

Yes. I use an AI coding agent to help draft, build and test these patches;
I review the result and send it myself. The v2 description was its draft
and I should have cut it down; v3 is much shorter.

> So as I suggested before: please introduce a symbol like
> BIAS_VOLTAGE_PIO_POW_AUTO or so,

v3 follows your suggestion with BIAS_VOLTAGE_PIO_POW_AUTO, setting all
two-bit fields to 01 once at init in the generic sunxi code for both
A733 controllers:
https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com

Thanks,
Enzo

