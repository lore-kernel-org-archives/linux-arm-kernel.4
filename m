Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9166D60A380E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4qalWhKW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0NoFrORe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5W7kX9rp2XBF1bJ27nT4HG77OkJIXZJCoQWjVdRY9vA=; b=4qalWhKWdMs1Ko
	AgFEw9aNUcV27D0Wn0gxhhcHSAaKUEp1ciJ2aHDrzJG8hLOrpBjIVD0mbemuv1RERrgoSDTUMPfcO
	R24wubly3yhNH+erqCcEOlf5x0ujTYPW1tkTooqLyVtcGwbBByFntyczOGi3c/G5fcWYF/2Pg9WuC
	Z0ZNxrLOiByBZ1HEr9N0deX3YGvAiN0vyNFUpqvBdLaPPXWcxIfgt2op7i5MgpCUO4Cyh6MbIHYkF
	CxLcwsv07zeGpr8eY/zZizjR/GLOJBUkaJXuvMwvR8MCCKLHFOSISbEChnTzUeIQIEQc7/RB8PmvK
	BSr+UyrGBPLyh4/2TPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIU-0000000BLRo-1OHp;
	Fri, 13 Nov 2026 00:37:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfIE-0000000BLLU-3bZc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:37:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso112380f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530245; x=1795135045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5W7kX9rp2XBF1bJ27nT4HG77OkJIXZJCoQWjVdRY9vA=;
        b=0NoFrOReVO+G9U4cmdudP5EWaoifrKLq9jRhggKLQTs9sJqnU3DvXX5FFfv8mijRIo
         qgPj+Phx/lHxGdc9YRn5VxQbfnIucn5MqNJnLtD+2xxDEZ54HY3d382Y3Liv9l4OV2Hs
         AcysECDF+VRZ7/1QxF9ottyEZ7YlDL6IWQ9sNvfKz0tuBX7k14u4Yjisfqn5FFWSVtal
         4q0T9GqNDpRH14m617MqLK664CVWAap5GJ+maOBXgSxEz2I0UHl5MlxzzORi+daSNa8K
         QnqMXOQ9AWnhw2dTWEdcC67AJH+GAoThN0E79wGag7ewrC6nCz6+Vm9MsFAz5UVpvzSa
         I8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530245; x=1795135045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5W7kX9rp2XBF1bJ27nT4HG77OkJIXZJCoQWjVdRY9vA=;
        b=1eDOQIwTWEBdvVc9IBdI9ptn23CPqp1iUHG6UiiB987USSH4dQQFXL4Bf6tM/DX95x
         uX46oYk0IX2Yo8YTZAdtKkHYF9amWYPADbCRQEg5GDWo7eXcY1ZCOdy6hAYbQ8Ji+6+G
         o42r7DCaddKKNgGakiHfHB3jwcsXnhkxReniQqkPUts4g8FwYz/peXMeqtID/TZcnzm/
         /0C0e1DCRACGF6UeuwkpbpRhorM3UUQMRqDFux7x7GSmVsDulp3YpwupQmd/KHPscpo9
         0DPHdAyGekMUyHqJY/y7OlL03LDdCWcgYxoFb9tvTectlc9wVDSFXjdbh86r2DOWlhaN
         FLmw==
X-Gm-Message-State: APuU4Z/eExahAkUTqV1M0ZjyyeZdGIXdXf0sBQIdV5+9MWGcNY5KQV6Z
	2pMRcMxU91PodM82KfqUrpCk3Xvu1RK0J21I6sFlOtHz93JNyitiiUds
X-Gm-Gg: AYBFou0WR9j/5nOBq3Ex/MiWYGda5m+HdO7RQWG1eTqR9sh+5JRjfB0TC4BABdwrnkl
	YJjqjAA3DUgJFleHHXJz78Fe+JJ+bI9pbiONNgLZGeXFdVd++y7Wla4ccEY0bHhNiKjqKAqSYsE
	LTDM1Md5I7iezqw/qy5mwCsn9E5SLDcbNs8axLh0vZ0bfO7EMzrXKfmZU4r9DsiiR1ccqp9r0ph
	cPfXjZmnUy/vneaUHQBERUM3O4gdfets+NOE8NW684Gyl4rNDIPWl+p101iClCxzCWj31EQJsvq
	OZnwyV4t2kCHOKw3apzpWPLXgT8D0+R/oA77vzFkyVCRUde8qS0dP03qu8uejeRYOT13fvZd3tX
	m0h+onpdULYbU6lfhL+/k6zz5C4dwobUK9OoUE5d9SCk3aiYPtm8hKNGl1GhO3BJHjPXNw9ytk+
	q3mGO3pyQ6kB7NyZidW7kcE2YjNMW8k6bHIKFuiTCp7uzV7KuE7U73eN7vdHZKBk+1IwFB20P0/
	iwOnBYnJF52FsWRPBfUYlVDFkkGhQyX8TAu+zI/LjSyjzJYAWOgsLm+Wdz2XuGA7MJNGsl+U70d
	aSyddLDNSVmD7muatGLAfg/wynHb7heloQA85md3ks90ST2c6DnHq8L3oSc/PPQOYl8nRISE6qg
	sX3ZVptBxdJcdawuf2PPVbNjOj56AUNP8l1nFQumrFOAqMR4CUcFcOdTi4jafEEF9zcRcMEHSAH
	OP/pE6Ez6shIwL3Wfl
X-Received: by 2002:a05:6000:1885:b0:499:d9a9:5158 with SMTP id ffacd0b85a97d-49c727d1e47mr2139782f8f.31.1794530245167;
        Thu, 12 Nov 2026 16:37:25 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm2702533f8f.44.2026.11.12.16.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:37:24 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	stefandoesinger@gmail.com,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock bindings
Date: Fri, 13 Nov 2026 00:37:22 +0000
Message-ID: <20261113003722.3667081-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015-misty-lively-galago-693c57@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-5-ghahramani.navid@gmail.com> <20261015-misty-lively-galago-693c57@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163726_914863_02ECA130 
X-CRM114-Status: GOOD (  10.90  )
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

Hi Krzysztof,

Krzysztof Kozlowski wrote:
> This is odd. Device is specific, fixed. It either is or is not
> compatible, not both.

Right, the next version drops the syscon compatible from crm2.

> Do not need '|' unless you need to preserve formatting.

Will fix.

> So the PHY does not need any resources from the parent? It gets its own
> clocks? See explanation of simple-mfd.

The next version has no PHY child nodes. The PHY registers are inside
topcrm, so topcrm itself gets #phy-cells.

> Incomplete example.

The next version turns topcrm into an MFD like Stefan's zx297520v3 CRM,
and I will make sure its example is complete.

From your other mail on this patch, none of the subjects in the next
version will have the redundant word bindings.

Best regards,
Navid

