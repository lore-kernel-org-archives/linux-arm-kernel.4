Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05063606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 20:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SS53D3V8;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YXm6ceWA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=; b=SS53D3V8vte3mhUJbSCxaVi3hJ
	FjDoNXYGLC2NALUiPT1ojzyoFziMmxQr7a0poPEeMLmY5sUPFmUFZ0Wm8JbfoKW+6AalINb/O2/hq
	bX+45kWaqsyDSke/gFkfig9HZjcXMIidm8Am/KGy+JEK+ytxoZOQxujCElOCIqPqeuRrfHsR13Ir9
	Rf3dWV+hBWCliuWReGvzYb2gkudPkomk0yZPuRzbjoZ7im6L7YGfRPirEfwFuLMwMgUIsYPU/sZJP
	oTrouOJD8M+NqBz78LwfcjkNWbAbMz+nip2Z3rj2W3ZgLtcIRDnXNmaOdfxWG6QDKKqZSFB/Hes+v
	n/qBOS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWSg-00000001iJo-2rb8;
	Mon, 09 Nov 2026 20:59:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWSc-00000001iHW-2ZWZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 20:59:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso14383755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 12:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794257964; x=1794862764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
        b=YXm6ceWAvdp6Et9vLxo/fOhN4dq0QV5BBWaNwMMULk9KG/r7sPXXDQH07PZ3mQCsOM
         rsW+t9AHQyBy/HU3dKQTe1XU5Hjbtly/LHwMW48B9h+csATcwdhOq84jkja7b1sF9wzh
         rtzbt8khcJLVDo7wvH68N6h8uHcTPP7c6FyahY63pDft/kEOvU4Qw/Q1jzzfAaKDWI92
         rcR5T+6NuHJNrx1K6ejql2vU/JQMDBpqD4bzyf2ukXOUo57jzZQr2LiSafYq4gdr8r2d
         WHBUbvrnW0f5mq83LXtJ75N638yres942cdSjWlL20cEUY84Ss+PfS3GbpEr9ymUcjnV
         A81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257964; x=1794862764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0yneiKg7DNhOrT8jayZCJtlhVR9ITH7sa+yxZSUWfA=;
        b=jvg2cbRKUYGKTip7BxdZ6YSGZmmtzcMh5+U/+uxUurriCC+NppsvI7RGRsys9QNXtj
         psYLndqujzHqgeX/4OpA3sfcUu3JGdcWaZmcZG1sAJ7JZaj5RkvhZJ4+2zQYZttsiqh3
         /svq7qAB/0I18IGzCbqG7bQdSTxMFRmOITpE7DAkhIhwYugmTe5nE4Ir8QNlJGEBSPqz
         sDAxVtcl+osjs6VQm3IVm+4poLjqi28IVuJuGc5NJkNvtbx5jqZ2pk7hcwfcU6kZXnqT
         nRU/lZNf0uaMUg8fQjkvzdP9GMGzOCEuovzZaIEffKxhUVqFmE0Qv4Tulvdjaf0Nz8sR
         XdTA==
X-Forwarded-Encrypted: i=1; AL+hErFkGTRk+3miPSqmBZw/XraAj8vogb45o5rmRGdWwhL3Omz9uIepL2kbpRo5s/u2U4lBj7hi1ThFyMDcOwmylXun@lists.infradead.org
X-Gm-Message-State: APuU4Z+Sj+flLALNMv/LES62cCMqdfZ0tHPMGlRvQiTKUcjO2WDXFR9Y
	/ePTZJoGYro9HD3o5h/FkISrK6AIzw3yoOoT4ZJrAtaQGGCQp9E/y/ZhT9MNF+fux8s=
X-Gm-Gg: AYBFou1KYKzjcXmGWncxMryQIz6R1tDX1k1Qlt7uWQ+KFD9xZ8ZZ1j7QfGIf/eMHID/
	zM5IsdugFuJp7bW8x/I8voyjiNXaaD2lNgTBoke8xiBaJ6wxOm/X7fFZLz6F906KIhNUkBfN3K6
	ok6PVX0faTBvk+Kik+VYVuLUztkR7OC/cT/LbhoE0k5S8rpSDM3c6aHLt/eE5N8qgK/6yJj91OD
	asNDjZ74cLk5arkucC9m29zpyJ0baZ0CKqNs9IVqsOK83+YnwYcKMOE5L36maIDNBJrXhQplIKJ
	0VnaWX3KyjstwEGdQS6nxVhxny4lNPs7uUasdAgMGNCZlk9CT8ELomCeaUQXI2+VSyd/q8Xf5qw
	fmJ7n2HsRAkoO7k9GVwQVeGa5+QzKbuCMkvu/4TI+9TtsCWw7rV0AWfF5rZVXS8HpLriAACGJw3
	o0/y21S6lzR9QZF907HvplbJn5pkRh7YhnYTwpeZ+e6/9BhiP0Su3dyNK/mg0pwXKx9OgkpYQBJ
	AKSslZPlxUsKjiDyr9K0+ypcYls10LwWC7gZlDF3Yln51faCMDTBxHWaI5WxIbUoIBCt8OdwTqL
	XHkmOOsNPOJfikH507vdQd3Uu8of33rwdt0W1OUNAgsdpPFHuA3jUnUAsrr+THPEy5DzygyS67c
	JEsUHvznGhQ1H8Tzndm7rQfdwu35/YbfP1OUmSgLmbj+1Xg==
X-Received: by 2002:a05:600c:3d96:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ba02347dc6mr6849605e9.17.1794257964075;
        Mon, 09 Nov 2026 12:59:24 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c99bsm1081150f8f.7.2026.11.09.12.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 12:59:23 -0800 (PST)
Date: Mon, 9 Nov 2026 21:59:22 +0100
From: Carlo Caione <ccaione@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add Amlogic S7 SCMI clock IDs
Message-ID: <avIv2GfXHuOPWJzC@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-1-7d501d62621f@baylibre.com>
 <20261108-computer-backed-d98862794d18@spud>
 <1jfqxa1jv7.fsf@starbuckisacylon.baylibre.com>
 <20261109-stature-splicing-a146b4cfaad4@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-stature-splicing-a146b4cfaad4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_125927_518864_E9EFD63E 
X-CRM114-Status: GOOD (  13.10  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 20:00:56 +0100, Conor Dooley wrote:

> The "document" in this case is the source code of the firmware then.
> The info might not be printed in the TRM, but it is determined by
> something, Carlo had to get the numbers from somewhere?

Yes, I got the IDs by enumerating the clocks exposed by the running
S7 firmware, logging their IDs and names through the Linux SCMI clock
driver (using a vendor provided firmware and kernel of course).

And yes, the DT cell is the firmware's SCMI ID, passed through
without translation. Renumbering these definitions would break that
correspondence indeed.

Cheers,

--
Carlo Caione

