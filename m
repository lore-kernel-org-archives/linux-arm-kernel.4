Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A2D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iDf0x71J;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=MeBx7NZq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kzZ572SYqNYS7AFbKEhSpyO0POmges/XmCJlcN/iV2Y=; b=iDf0x71JeX2T0f
	gu5+rc3rVoZqfP01mosfvpY05EpGHKDEnWoy6qyDuykjTW5exO9XuYPxExwFgIIRG6YM3CX4MgcCr
	gorWHQmEIYs8ON5sSw2NPAXK6rHBcHrn/omaRr2GDGf7Lz8+rJ0jXPanlrhp6VEkWkTRZV2PR4dOn
	JDbiB4naNepElMybxysT2CwPht2LZFdq+coF4RR5wqg2dpnjs2FRlayq0+P6cDQNiu6MKka1oX8xi
	rOnkgmE/IYv2MR1/UhuUxKVdlKED00nZfTe+F44IzbntgliHThlHY1WdVMg9XDS09rLUKL3t7s3Nj
	YzqP/ctXVfncIsGq3KOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDHP-0000000G1wA-3lF9;
	Sat, 14 Nov 2026 12:54:51 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDHM-0000000G1vK-0d0L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 12:54:49 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1b3b4944abeso309340c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 04:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794660887; x=1795265687; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzZ572SYqNYS7AFbKEhSpyO0POmges/XmCJlcN/iV2Y=;
        b=MeBx7NZqmIuTjbuJIgU+sE2VXLTB+42zV860m0otEGWxBvRup/X5O2wmegTS/SMepx
         ox8hsG+uT6BJVYkJRKfEE1HZCR8W5BUVYZomuuVAX+lORZVpF7uRI4/0x1RvkVh2CbRa
         yJFGTgv8PVMMR7KWq9nmZuh6iDmo4CJ094UMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660887; x=1795265687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kzZ572SYqNYS7AFbKEhSpyO0POmges/XmCJlcN/iV2Y=;
        b=0eYVXTfxwGk6LpC0SfR+ZZMQs/xOtQ1QC0f7YuvHFtDfO5j4OdcO55+JBfT9cItXb+
         bn8e3aRogQqCm9c0iq1xu0sLS/yxix+WAnPENcg6B3ut1Wl9mMTYyIjPFlHu3yUZgR2a
         f7ieyl6pllFirenONYhX0L+oLurWrT6s3hhPhb2kg+zoksE+mSTbdiwompyNi/sYyANo
         GnmTP4+zejX9pn3lnLfylOdH7+uAa66xRYibSx9AeLIOtIsEKkAF+sT8K+xsRFM8620N
         0pz4KgUmLThvUU5/ygaLVDrBsY+fvAwJhKb6wMPsXEYAIk611rfXF9hjHOPIKeUWl4UU
         l9kg==
X-Forwarded-Encrypted: i=1; AL+hErEeoaZgPZyGI2VocSjbTPq1Cp+iGenyE4ipnhGpy6mrrpVVMB7IKIpWdoIc6vLkxpc15FjTQY2ZVaC2o7rfw+mW@lists.infradead.org
X-Gm-Message-State: APuU4Z9WMwdSZRHFYcGGPfagHn3IoYm6rXlD0EEQTWpX1ynAPmBDLEX+
	itoRnl6goHSYvPnG+5iARwOpU6Ah3XVy6b3uFoMv4TnqrJM2pFxgWlvKI8VrY16/Hx0=
X-Gm-Gg: AYBFou1XIS61g/ejTjoMWXL8k1WdGFIYCO7X7ww0C4GraUbMlUivyCy2eJFwonQL+ir
	7secrWk2XDaAEgtnYv5kVhYUy1QZQmJHArfUrTvk5EnTYRczsRGFpppsFrePGWUsPR5tDOzvbL+
	D7FpHItQ165l8/uVfBKCq6VxQAy1Y0OHTjaneqawaktsQ5lxOlVI5hiPKr6Diqnn6kflKgGCaVK
	9PhahCJk6+ArTJA5rczzmyCWnUjRIbet0z+OEDPRINpf618wHJWXQmgw4UFv9DtiMd78QDFlpA6
	yqVxFSQBAkmx9xSr2SkU2RrkvR7uPBjINVCRIDysljlsGvAOZsEHTIUWUihrhB28CIBFg3XNWZA
	EPVLXLa5tEQ8B3Cc16DqfAo4DBVNtri64zUIG77H6hSSUgT8vOXb80zeC/96ya+tfABvpgFATGa
	26n2EzBx5qOb3FZbA2rqFaFa9RFYFn1uLYCm7+jzbPAUQlEmuWLV8BM3Nj7k1uo/bdUSaNqOZgd
	UirBtw4FOyB4tKpIVJHA4vz769THuVqhqI51GZxYAYCIli8hM9UgV1dOXG42+ZM01mUmB4WdHgU
	EVqSHShxw2b126m5g3VN6FyLvgbdg+TeWDapxjarA7xsrYdGflXH6AIxJ9DHnvmSm1PoizTZ3+b
	Uh5vCFx3IdPuT
X-Received: by 2002:a05:701b:2706:b0:1b2:4c54:d976 with SMTP id a92af1059eb24-1b50311d3e0mr5111198c88.31.1794660886535;
        Sat, 14 Nov 2026 04:54:46 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm15468097c88.12.2026.11.14.04.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:54:46 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com,
	royalnet026@gmail.com,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 00/12] accel/rocket: RK3576 NPU (RKNN) enablement
Date: Sat, 14 Nov 2026 21:54:35 +0900
Message-ID: <20261114125437.9986-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794615324.git.gahing@gahingwoo.com>
References: <cover.1794615324.git.gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_045448_203711_4F6F4999 
X-CRM114-Status: UNSURE (   8.10  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 14, 2026 at 04:05:17PM +1300, Jiaxing Hu wrote:
> This series adds RK3576 NPU (RKNN) support to the mainline DRM rocket
> driver.

I checked the accel/rocket patches for regressions on a ROCK 5B+
(RK3588): MobileNet inference with up to 6 concurrent clients, runtime
PM cycling, core unbind/rebind, GET_PARAM (returns 1) and recovery from
93 forced job timeouts all pass, with no warnings.

For patches 2-5 and 8-10:

Tested-by: Sidong Yang <sidong.yang@furiosa.ai> # RK3588, ROCK 5B+

Thanks,
Sidong

