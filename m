Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A80E60A6F5F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3U52U7Jk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsMsyW3m
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FzODplEKs+WHcm/+4H/RVQkgIn8A4rJ2dXxs9VQSrPA=; b=3U52U7Jkx41uOK
	18aa4avLDjLetveLi/PIB0SyRcC9o5Jt+2DsErCex6RvB6cFJyw0FnLZhylJFr7Y3dF1Omj1yWSIy
	IKU1Xf18bjDWe7bIGLES3bfSFgE+VoD1PcCOCDFhUCBePCxoi4dKJ+6Q7zLUZTo6tD2o62dV4EB4p
	+GEGTAt5RJoUDE57Mnut90lG5EHXy67EC0skG+MScgYi9XJ8KvyQfhdgpLg/NLsMjp8hP2wuAdTOh
	HfC8J5rTR80wRgnewFg2PXItkxGGytEsvgOkBF+5zvuFA/lVc8EdAOiWSlQPEc8dRWMcYS0RunzK7
	gV0jOHfuIYfadxJ75o5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIq-0000000BLfu-1ORZ;
	Fri, 13 Nov 2026 00:38:04 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIg-0000000BLZI-1uxH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:37:56 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4919a880834so158680f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530273; x=1795135073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzODplEKs+WHcm/+4H/RVQkgIn8A4rJ2dXxs9VQSrPA=;
        b=rsMsyW3mqpjJb8Q9Zr2wBUDVd7jQyBwi5BkQ41GIEeMzwH7/3N/t4b1++ZekBvY679
         rRx6eExgdSL/Yaok6KHSYHMX8rUraKSjIS/A3Tlc07xpliRgUk/nmkSOXUtRc7GH32TK
         nJwhDN5YEyjtHOV4VG84gdNSm3yCL9Z0m2lM8WvMXwnF3ATi9gKheNVPxoV7ggsoPMel
         TYRKiJtSG3s5fm11N+BloIq+wZcukNSrE479Yf6rasRlspkmhLy+EcVt6BhAFVpx7KPG
         zYNmQgVX9nnumyKZb0dNoCjcT2z0QlUY7Ok0TElcL+B766ggQcpOp/JtT/AUjsNpCfDy
         gJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530273; x=1795135073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FzODplEKs+WHcm/+4H/RVQkgIn8A4rJ2dXxs9VQSrPA=;
        b=EFvpSTH794PwZlr+5/jBd53R25CaxBoeywVYN/dgLga6otTtTYzdhBuRbxRWdK18ql
         WLeR7K+zLbskc+9iGNQgXE/JXTtChUvhMMVWL0zvzSghle5RhwTHWdW+1x8oevAj2ZRB
         KGCLzLrH9eZ2QHX+pZDjRDj1qpBjlq4KNBWdtIwkF9t6JcorohFGr+ITZThYhj1qYQMT
         YOnEIeJkv0FvCtnJJYoKobYHW8cqDWRwVBYtJ+P91g7s3Z06eH5CQBcySjmzSkGdI96t
         QlSdCwS0fjV3TezGeJGTNsewcixWN8q/KOUrWDbzZtEBPxMQJNRYq5dz8U4Ad4b3wKeE
         TW8g==
X-Gm-Message-State: APuU4Z9IjyI4Hz56t7OSkeX/0CYPSdrlnV5Rjoh2B93axMlA3wzoCaAj
	5o5Oz7vDEcRMLg5YB1gT9RmZ85H3qtdpXrWgH+jU4M8qawgcvhtcsp2H
X-Gm-Gg: AYBFou2stH7U58UgCP+/Zl2pFQx6E/8sV51va4/Odao+EGcslXv2QqUITUffZsAoiWG
	6LG8MRY2ob6xOmmVSCoN3pLU8GnCi9Xmtee5W3E+m44K4TEF8Ls6UCbC/az/SbaExfuPa4P1eve
	JIOdctA6Aa/GQ0xSfmhI8Wkl1KiIrhiqe9YmNFFj/Yg26i7CNin+/S8gdcdmITXnuAZlUP7BGVK
	jo7cOfIM+Xr+gHVxWKqbHDAHeXOEMSJ/wQxGjJxXbq3dOVhxzdjdbLNpOHIZNFuRG0j1SQa0RDd
	oZ+J/J/WYIObrv9SQtqdOlmZ4exaexxyHQBUlhgZtSjyLwqL+M803pkmXT8EZsC3J2gvAPJVC1d
	GMDUXaBeeCr5GQlmV9odeWZBx1qSBttyH2CGZzfBZa90jSXX+bbSlDFly0StIqozvxnoFWZ7wtr
	P/0B7DIGheZ5r2sKKwQrxZMf10FLOFVKunaBwisMLE7yV+nFc1SGP+KhAvmsetPYgCJ/KbSdQil
	QNLNh4aNJiXzppguH88CMkgOA2ipw2tEC0+pYamHNBIxZFI/tMeV1Jz7QTL00tWQsBfeEH321Ec
	pY6f6fYgtlK+ctZ1rgbsNoYuofoWQsBHibimgbscmVZWcyMkjbj21CCQyfJKHQ2Ui81BwMiW0+c
	PW6lIxCXuIJLzGykFk2UB4iw3qm+sFRgSHHpiEHbP285VbDPrqnWcXvGl9md0dhFgdrd3jMPb7v
	kSzg5Sanchz3+C7wF92mVYRozp0PpqIkkUv8zi3nM=
X-Received: by 2002:a5d:584c:0:b0:493:c0a:5087 with SMTP id ffacd0b85a97d-49c72e85557mr2540807f8f.51.1794530272663;
        Thu, 12 Nov 2026 16:37:52 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm1741922f8f.19.2026.11.12.16.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:51 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/24] dt-bindings: PCI: Add ZTE ZX279128S host controller
Date: Fri, 13 Nov 2026 00:37:50 +0000
Message-ID: <20261113003750.3668725-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027214010.GA1212169-robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-13-ghahramani.navid@gmail.com> <20261027214010.GA1212169-robh@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163755_312406_DC11771C 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Rob,

Rob Herring wrote:
> Drop. No point in -names for 1 entry.

I will drop clock-names, reset-names and phy-names in the PCIe series.

> Is this for PERST#? If so, make that clear.

I think so. Both slots share one GPIO, and the driver holds it asserted
for 100 ms and releases it before the links come up. I have no
schematic to confirm that it really goes to the PERST# pins, so I will
check that before I call it PERST# in the binding.

Best regards,
Navid

